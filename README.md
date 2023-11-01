
## Reflection

### Iteration 3 did not provide an interaction pattern. How did you approach designing this iteration? If you did not get to Iteration 3, reflect on how you think you would’ve approached the design and problem solving process.
- We started by reviewing the entire iteration and talking through it before we started coding anything. Then we took a break for the night.
- When we came back to it, we started throwing spaghetti at the wall and seeing what we could get to work.
- We started with displaying both boards since it built on the render method which we'd just completed in iteration 2, and it was exciting to see some semblance of a game.
- Then we tackled the computer ship placement since we thought it would be the most challenging. We spent a decent amount of time on this before moving on.
- It was pretty smooth sailing (pun intended) until we got to the End Game method and we couldn't get it to return anything. We think it would have been helpful to take a longer break, but we didn't because of the deadline.

### If you had one more day to work on this project, what would you work on?
- First, we would give the computer more personality by implementing an array of sassy remarks that it filters through as the game is played.
- We ran into an issue with our random_coordinate method in the board class, where it wouldn't get stuck in an infinite loop, but it seemed to run for a very extended time(30+ seconds). This results in the game being playable about half the time. It gets stuck on the place_computer_ships method, so once the turns have started it doesn't ruin the game. We came up with a few ideas to resolve, but didn't have time.
- We'd like to make the game board larger
- We'd add `gem colorize` for a better UI.
- We'd like to implement some intelligence into the computer's logic when placing ships so when it gets a hit it continues to guess near that hit.

### Describe the pairing techniques you used while working on this project.
- We pretty much exclusively did driver-navigator. It worked well for us and actually saved us time in the long run, especially in iteration 2 because when we got hung up on something one of us would typically figure it out and explain it to the other rather than spending hours figuring it out alone. We were exposed to new ways of doing things by working together and seeing other ways to accomplish the same things but in a different way. We also avoided merge conflicts by working together this way.

### Describe how feedback was shared over the course of this project.
- We checked in a few times on our DTR and shared positive feedback when things were working well. We have plans to give more formal feedback tomorrow before and during the project Retro.
