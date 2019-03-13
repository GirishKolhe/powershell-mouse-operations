# powershell-mouse-operations

A collection of utiltiies that helps AI/ML image processing developers/SQAs to stimulate operations such as mouse move, drag and other activities

# Background

Recently I got an opportunity to work on AI/ML image processing algorithm. As a part of automation effort, I found descrepencies in the region of interest while drawing a contour. 

When I talked to algorithm developer, I realised that it was not an easy task to reproduce issue in development environment. The whole excercise took a lot of time and bandwdith to accept and eventually close the issue. The issues encountered were right from  setup/installation pre-requisite to providing more flexibility in terms of debugging the issue.

It was that moement, I decided to build collection of utilities that would give more freedome to algorithm developer. There are many tools available in the market. Every tool has its pros and cons depends upon installation/usage/COTS-SOUPS/Process/licenses. Hence aiming for these set of utlities that breaks releases team from all constraints

## Highlights
> This repository will have basic utilities that will perform mouse activities

## Notes
> In case of "cannot be loaded because running scripts is disabled on this system" error, use below command
> open console and excute below commands
> >> powershell -ExecutionPolicy RemoteSigned .\get_mouse_position.ps1
>
> >> powershell.exe  -ExecutionPolicy RemoteSigned -file mouse_drag.ps1 -appname 'Untitled - Paint' -startX 274 -startY 289 -pixels  "400-500-200-400-100-600-1000-300"

### Keywords
> powershell winAPI user32.dll mouseevents
