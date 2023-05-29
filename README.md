# Duck: A company management app

For no installation demo: 
  - Youtube: https://youtu.be/wEby6ISwd3I

<p align="center">
  <img src="https://github.com/ceejpineda/duck-v3/assets/57590361/d1727f51-51ef-4a36-b2a2-95ee359444d6">
</p>

## Description

Duck is the ultimate company management app that brings together Discord, other functionalities. Create groups for workmates, delegate tasks with Trello-like capabilities, track attendance with Time In and Out, and stay connected with a chat group system like Discord. Simplifying your work processes and boosting productivity is the goal of Duck.

## Tech Stack used

  - Ruby on Rails
  - Hotwire/Turbo
  - Action Cable
  - Stimulus
  - Tailwind CSS
  - Redis
  - Vonage API
  - Twin API for RichText

## Features
  
  - Time In and Out system to track attendance
  - Chat group system like Discord for real-time communication
  - Time In and Out feature with displayed message if late to time in, total duration of work hours, current date, time of time-in, time-out, and break
  - Indicator of employee activity or inactivity
  - Automatic Email Reports when Clocking out with Task and TimeLogs
  - Daily Report feature for accomplished tasks
  - Sends Daily Report to the admin via email
  - Video Conference Feature
  - Electron JS Desktop App
  - Semi Responsive UI and Dark/Light Mode using TailwindCSS
  - Send styled text, attach formatted code, and Pictures in the chat.
  - Works as Single Page APP (No refresh when changing room and chatting, links changes even though no refresh)


## Installation

If you want to try the app, run the following commands:

```sh
bundle install
yarn install
./bin/dev
```
Then access the localhost, to view the full web app:

## Screenshots

1. Login
![login](https://github.com/ceejpineda/duck-v3/assets/57590361/8570d5ad-fa49-4f92-9b6e-25483a003364)

2. Main 
![main](https://github.com/ceejpineda/duck-v3/assets/57590361/54db5fde-0403-432d-81a9-ff560e9fd3b7)

3. Chat Feature
![chat](https://github.com/ceejpineda/duck-v3/assets/57590361/d279838a-8d21-4162-807b-111041423615)

4. User Profile
![profile](https://github.com/ceejpineda/duck-v3/assets/57590361/b75c825b-d545-45bd-a735-c8c39c8cdd8f)

5. Daily Report Sytem
![reporting](https://github.com/ceejpineda/duck-v3/assets/57590361/f97d3acc-2d64-4c33-9f7e-8d96f93272e5)

6. Email from the Daily Report (With Time Logs)
![email](https://github.com/ceejpineda/duck-v3/assets/57590361/4ee23b73-4c64-4c0e-b0d1-1b49eee39d0f)

7. Video Conferencing Room
![video conf](https://github.com/ceejpineda/duck-v3/assets/57590361/e97611ff-f069-46d5-b5a4-5b21c10d5b35)

8. Inactivity Tracker
![inactive](https://github.com/ceejpineda/duck-v3/assets/57590361/752d66ae-fb8a-486e-82c9-d7839e417fc2)

9. Electron JS Desktop App
![electron icon](https://github.com/ceejpineda/duck-v3/assets/57590361/9fe5ac4e-b186-451b-9714-bf9104ffc8e1)
![electron](https://github.com/ceejpineda/duck-v3/assets/57590361/37fbc3ed-da19-44d6-b0c8-e22bb42f4e9d)
