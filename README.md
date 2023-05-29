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




```sh
bundle install
yarn install
./bin/dev
```
