Setting up git, using the CommandLine

1) Set your username
```
git config --global user.name "Greg Hilston"
```

2) Set your email
```
git config --global user.email "Gregory.Hilston@gmail.com"
```

3) You can test if you set them correctly using
```
git config --global user.name
git config --global user.email
```

4) These steps will just make things easier
```
git config --global core.autocrlf input
git config --global color.vi true
```

Binary File Woes? Rebase!

1) Get a fresh clone
```
git clone https://github.com/Hackademy2014/fit.git
cd fit/
```

2) Reset to the last known good point
```
git reset --hard HEAD~3
```

3) Push this state, essentially rewritting history
```
git push -f
```
