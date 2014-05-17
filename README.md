Families in Transition (FIT)
===

Excerpt from www.fitnh.org:

"Families in Transition (FIT), a nonprofit organization located in Manchester, Concord and Dover, New Hampshire, was founded in 1991 in response to the growing number of homeless individuals and families in the greater Manchester area and throughout the state. Since its inception, FIT has been committed to providing only the most innovative, comprehensive, and effective interventions specifically designed to help homeless individuals and families reach beyond the cycle of homelessness to lead healthy and successful lives. Our belief is that having a home is a basic human right and is fundamental to becoming an engaged and contributing member of our community."

Binary File Woes? Rebase!

1) Get a fresh clone
git clone https://github.com/Hackademy2014/fit.git
cd fit/

2) Reset to the last known good point
git reset --hard HEAD~3

3) Push this state, essentially rewritting history
git push -f
