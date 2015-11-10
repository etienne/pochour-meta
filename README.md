Setup
=====

```
bundle
bin/rake db:migrate
bin/rake bower:install
```

If you want fake data in your database: `bin/rake db:seed`

Features
========

- Invitations
- Add lists to WYSIWYG editor
- Show time gaps between comments (and articles?)
- Add language switching and English translation
- Allow users and communities to have a default timezone setting
- RSS feeds for every articles list
- Allow comment editing for a certain time? 15m?
- Sort epithets by number of votes
- Add page with all epithets
- Limit epithet votes per article per person?
- Show epithet vote users on hover
- Add random article of the day
- Autocomplete epithets
- Make sure pasted text looks good with paragraphs and all

Looks
=====
- Clean up community form
- Clean up account form
- Shim mobile version

Bugs
====
- Fix non-clickable comment section

Thoughts to be had
==================
- Do something with public/private communities
- Add subtitles?
- Consider italics in article titles?
- Find a better word than "communities"? "group"?
