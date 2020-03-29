# Dark side of OS X

I have some data requirements under GUI when I use my Mac so I wrote the following scripts to resolve them. Details to follow. 

First comes the db connection function. The apps mentioned here are using sqlite. Note that you can not retrieve any app data directly because of [System Integrity Protection](https://en.wikipedia.org/wiki/System_Integrity_Protection). For accessing them, either change the permission or make a copy.


```python
import sqlite3

def query_db(database, query):
    db = sqlite3.connect(database)
    c = db.cursor()
    c.execute(query)
    
    return c.fetchall()
```

## 1. Safari (Version 12.1)

Safari is my default browser. I've been always wondering how I spend my time on web browsering. For instance, what did I visit? How frequently was that? There might be some stats extensions for Chrome or Firefox but nothing I could find for Safari. Here's my solution. 

Safari history data: `/Users/<REPLACE-WITH-YOUR-USERNAME>/Library/Safari/History.db`


```python
history = "History.db"
```


```python
# top 10 most visited urls

query = '''
select url, visit_count 
from history_items 
order by visit_count desc 
limit 10;
'''
query_db(history, query)
```


```python
# top 10 most visited domains

query = '''
select domain_expansion, count(*)
from history_items 
group by domain_expansion
order by count(*) desc 
limit 10;
'''
query_db(history, query)
```

## 2. Notes (Version 4.6)

I periodically triage my notes through the following way then do a backup although it seems time machine may help which IMO is not that flexible. 

Notes Data: `/Users/<REPLACE-WITH-YOUR-USERNAME>/Library/Group\ Containers/group.com.apple.notes/NoteStore.sqlite`


```python
notes = 'NoteStore.sqlite'
```


```python
# content of your notes

query = '''
select ZDATA 
from ZICNOTEDATA;
'''

# content of the 1st note

note_0 = query_db(notes, query)[0][0]
```

There might be encoding issue when `print (note_0)`. The notes are compressed binary. Take 'sample' as an example - file 'sample' is a note I exported from my Notes db. 
``` 
$ file -I sample
sample: application/x-gzip; charset=binary
```

And here's my way to make it human readable.


```python
import zlib

note_0_readable = zlib.decompress(note_0, 16+zlib.MAX_WBITS)
print (note_0_readable)
```
