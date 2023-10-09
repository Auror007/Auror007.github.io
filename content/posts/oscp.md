+++
author = "Parth Parmar"
title = "My OSCP Journey and A Racing Game"
date = "2023-07-17"
description = "A detailed  blog about my perspectives on the new OSCP Exam (2023) from Offsec. How I prepared for it ? And the what my favourite childhood computer game taught me which was relevant for this certification."
tags = [
    "OSCP","exam","resources",
]
+++

> Dear Parth, <br>
> We are happy to inform you that you have successfully completed the Penetration Testing with Kali Linux certification exam and have obtained your Offsec Certified Professional (OSCP) certification.

This message is what I dreamt of nearly 2 years ago. Not knowing what it would take me through and amount of efforts required to earn this certification. I am writing this blog to share with fellow OSCP Aspirants my experience, resources and how a computer game helped me build my "Try Harder" mindset. This is a humble attempt inorder to help others and try to make you believe that you can do it too.

> NOTE: These suggestions are based on my perspective and experiences. Yours might be different so use what you like and develop your own methodology to learn. 

Exam information: The industry-leading Penetration Testing with Kali Linux (PWK/PEN-200) course introduces penetration testing methodologies, tools and techniques via hands-on experience and is self-paced. Learners who complete the course and pass the exam will earn the OffSec Certified Professional (OSCP) certification which requires holders to successfully attack and penetrate various live machines (6) in a safe lab environment. The OSCP is considered to be more technical than other ethical hacking certifications and is one of the few that requires evidence of practical penetration testing skills. Reference: https://www.offsec.com/courses/pen-200/

#### My Preparation Journey

##### Phase 1: Before enrolling in the course and pulling the trigger
---
I started this preparation 2 years ago when I was sure that I wanted to do this certification. At this time, I was following the subreddit r/oscp and started with HTB (Hackthebox machines). After doing nearly 8 user and 5 system flags, I started a few udemy courses to improve my knowledge and methodology. Mostly because I was unsuccesfull in exploits even after spending 3-4 hours on a simple box.

1. https://www.udemy.com/course/windows-privilege-escalation/
2. https://www.udemy.com/course/linux-privilege-escalation/
3. https://academy.tcm-sec.com/p/practical-ethical-hacking-the-complete-course (Previously on Udemy)

Note: I did not touch active directory at this point in time because I started preparation keeping in mind the old format of the course.

After completely stopping the preparation for 1 year, I started practicing PG Play and Practice machines (completed nearly 10 machines with a few hints) in 1 month. And completing the bufferoverflow room in tryhackme https://tryhackme.com/room/bufferoverflowprep which was going to guarantee 25 marks.


##### Phase 2: New exam format Active Directory introduced
---
After these small steps I completely stopped my preparation. Trying to find the motivation for scheduling exam and planning my path forward. In December 2021, offsec makes an [announcement](https://www.offsec.com/offsec/oscp-exam-structure/) that the fixed bufferoverflow machine has been replaced with an Active Directory set of 3 machines. With an all or nothing marking scheme. So you either do all the 3 machines for full marks or none. This meant that I had to learn what Active Directory was and prepare a new strategy. So I gradually started searching for active directory resources and did the following courses/online labs.

1. https://tryhackme.com/room/winadbasics
2. https://tryhackme.com/room/attacktivedirectory
3. https://academy.tcm-sec.com/p/practical-ethical-hacking-the-complete-course (Revised AD section)
4. https://github.com/Orange-Cyberdefense/ocd-mindmaps/tree/main/img (Great resource. Never used it but kept a copy incase I was stuck)

##### Phase 3: Starting the PWK course
---
I bought the PWK Course near the end of February 2023 and started doing the excercises and Labs. After doing about 10% of the excercises and 4 machines, they changed to new course. 20 Days of work down the drain. Now it was required to do the new excercises and Labs which were much better than 2022. Even after trying much it wasn't possible for me to complete all the labs due to that initial setback. 

##### Phase 4: Lab Extension and setup for exam
---
This is the most important part as I completed nearly 38+ machines in under 25 days of time. Ligolo-ng was my friend. Used it heavily during the labs. Took notes of each machine I did and treating it exactly like an exam machine. During the course, I made elaborate notes of various commands and concepts that I didn't know about. And while doing the labs I made a very short cheatsheet of commands which I could copy paste for easier access during exam. Took hints whenever I got stuck for enumeration and methodology. But I added those things to my personal "Do not forget list" so that it was never repeated. Sometimes, the box itself is not set up properly so reverts are helpful in practice as well as the actual exam.


I scheduled my exam on 4th July 2023 10 AM to 9:45 AM 5th July 2023. Didn't touch my laptop on 3rd of July but made sure to prepare for the exam on or before 2nd July. For notes, tested obsidian + git combination to sync notes. Used "Flameshot" tool for screenshots. Organized folder and copied my condensed cheatsheet and notes to the same folder. Copied personal note template for machines made during labs. Made a snapshot of the VM's state before turning it off. Enjoyed and relaxed on the day before exam and slept early.


##### Phase 5: Exam experience and Racing Game
---
Logged in to the portal 20 mins before the start time, waiting for the proctor to join in. 15 mins before the scheduled start time, proctor joins and finished all the setup in 10 mins. I shared both of my screens and wait for another email which gives us the VPN credentials to connect with exam environment. I had some weird issue where my screen share disconnected every hour or so. Therefore it was annoying to reconnect it as and when required.

- 10:00 AM Started scanning the AD set and 2 other machines simultaneously. My strategy was to continue with AD set if I get initial vector in 4 hours. 
- 12:00 PM Got initial access to first standalone machine
- 12:30 PM Got initial access to AD machine
- 3:00 PM Still stuck on AD privesc and reverted twice. Asked the proctor to check if the machine was in correct configuration or not. It took around 2 hours for finishing and used 2 reverts from our pool. While I continued on other standlone machines.
- 4:00 PM Got root user on the first standalone machine.
- 5:00 PM Initial access on second standalone machine. At this point, I was confused whether to pursue AD Set or do the other boxes. Took a break for thinking.
- 6:30 PM Privesced initial AD client and got the confidence to pursue other machines in AD set.
- 7:00 PM Set up ligolo agent and started scanning internal IPs. Got Initial access to 2nd client.
- 7:30 - 8:30 PM Dinner break.
- 8:30 PM After trying complex vectors, simple things got me another privesc.
- 9:30 PM Gained access as Domain Admin :)

Essentially this was 80 marks in the bag in under 11 hours including the bonus points from excercises. For those who don't know about the recent update from offsec, now we don't have to prepare a report for all the excercises. Just complete atleast 80% of excercises from each module.
 
- 10:00 PM - 1:00 AM Reverted all machines and repeated steps from my notes in a copy-paste manner. Took a lot of screenshots.
- 1:00 AM - 6:30 AM Sleep
- 7:00 AM - 8:00 AM Privesc on 2nd Standalone machine
- 8:00 AM - 9:00 AM Scanned the third machines but decided not to go forward and just re-checked my notes for all other machines.
- 9:45 AM End

You might think how is any of this related to a computer racing game. I used to play a street racing game called "Midnight Club 2" years ago with my best friend. It was multiplayer but we played career mode consecutively. The racing laps would last for nearly 5-10 minutes for big races. If any car overtakes me or I lose my "nitrous" speed ability or crash my car, I would just restart the race out of frustration. My friend used to stop me from doing that and believed I could still win. So, I would continue the game knowing I could lose but I end up winning some of the hardest races. This incident even after many years made me realise the importance of patience and believing that we can win. After losing all my special abilities, I could concentrate just on my driving skills rather than those special "add-ons" or the thought that I might lose the race.

During the preparation and the exam, the thought of "consequences of failure" never came to my mind as I was ready to accept whatever came my way after all the hardwork I put in. This helped me concentrate on finding ways to root machines instead of thinking negatively during setbacks.

These ideas resonates with a verse from one of my favourite books (Bhagavad Gita, Chapter 2, Verse 47):
>```
>                            कर्मण्येवाधिकारस्ते मा फलेषु कदाचन।
>                          मा कर्मफलहेतुर्भूर्मा ते सङ्गोऽस्त्वकर्मणि॥ २-४७
>```

> Which means we have the right on our actions but not the fruit/outcome/result of our perseverance. 

I hope this blog and the resources mentioned below helps the reader in their OSCP journey. Feel free to connect with me for any questions.

#### Other Suggestions:

- Take Breaks (I took nearly 10-15 small breaks during the exam just to reorient my strategy and think of different vectors)
- Revert whenever required
- Look for simple things
- Drink lots of water
- Make your own cheatsheet to just copy/paste commands
- Learn 2 tools for each tactic. For instance, learn ligolo-ng and sshuttle.
- Take hints whenever required. But make sure that you don't miss it the second time.
- Make detailed notes even during preparation. It's boring but worth while in the end.
- Pre-plan your time management before exam.

##### Some of the best resources I used

Active Directory Resources:
- https://blog.harmj0y.net/blog/
- https://adsecurity.org/
- https://wadcoms.github.io/
- https://www.ired.team/offensive-security-experiments/active-directory-kerberos-abuse
- https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Active%20Directory%20Attack.md
- https://m0chan.github.io/2019/07/31/How-To-Attack-Kerberos-101.html


Enumeration Resource:
- https://book.hacktricks.xyz/
- Google (Simple Keyword search or Dorks)
- Searchsploit tool or exploit-db.com

Resources for machine methodology
- https://0xdf.gitlab.io/
- https://ippsec.rocks (Takes you to specific windows timestamp in ippsec videos)


Privesc Resources:
- https://gtfobins.github.io/
- https://lolbas-project.github.io/#
- https://github.com/carlospolop/PEASS-ng (linpeas and winpeas)

Pivoting tools:
- https://github.com/nicocha30/ligolo-ng (Recommended)
- https://ap3x.github.io/posts/pivoting-with-chisel/