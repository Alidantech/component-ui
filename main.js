/**
 * The main js file has links TO THE time component
 * 
 */
// Import functionality from Timer.js
import { TimerComponent } from './components/Timer/Timer.js';

document.getElementById("timer-link").addEventListener("click", function(event) {
    event.preventDefault();
    createTimerUI();

});

/**
 * create ui for the timer component
 */

// Function to create and manipulate the timer UI in the DOM
function createTimerUI() {

 // Create a link element for the timer CSS file
  const link = document.createElement('link');
  link.rel = 'stylesheet';
  link.type = 'text/css';
  link.href = 'components/Timer/Timer.css'; 

  // Append the link element to the document's head
  document.head.appendChild(link);
  // Create a container for the timer UI
  const componentContainer = document.getElementById('component-container')
  const timerContainer = document.createElement('div');
  
  // Create the timer display element
  const timerDisplay = document.createElement('div');
  timerDisplay.classList.add('timer-display');
  timerDisplay.textContent = '0:00';

  // Create control buttons
      const startButton = document.createElement('button');
      startButton.classList.add('timer-button', 'start-button');
      startButton.innerHTML = '<i class="fas fa-play"></i>'; // Font Awesome play icon
      startButton.title = 'Start';

      const pauseButton = document.createElement('button');
      pauseButton.classList.add('timer-button', 'pause-button');
      pauseButton.innerHTML = '<i class="fas fa-pause"></i>'; // Font Awesome pause icon
      pauseButton.title = 'Pause';

      const resumeButton = document.createElement('button');
      resumeButton.classList.add('timer-button', 'resume-button');
      resumeButton.innerHTML = '<i class="fas fa-play"></i>'; // Font Awesome play icon
      resumeButton.title = 'Resume';

      const stopButton = document.createElement('button');
      stopButton.classList.add('timer-button', 'stop-button');
      stopButton.innerHTML = '<i class="fas fa-stop"></i>'; // Font Awesome stop icon
      stopButton.title = 'Stop';

      const resetButton = document.createElement('button');
      resetButton.classList.add('timer-button', 'reset-button');
      resetButton.innerHTML = '<i class="fas fa-undo"></i>'; // Font Awesome undo icon
      resetButton.title = 'Reset';

  // Append elements to the container
  timerContainer.appendChild(timerDisplay);
  timerContainer.appendChild(startButton);
  timerContainer.appendChild(pauseButton);
  timerContainer.appendChild(resumeButton);
  timerContainer.appendChild(stopButton);
  timerContainer.appendChild(resetButton);

  componentContainer.innerHTML = timerContainer.innerHTML;

}

