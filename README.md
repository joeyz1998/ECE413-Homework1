ECE413 
Homework 1

Daniel Zuerbig

hw1.m is the main file, running that will play each scale and chord in order, and then generate the plots of the four chords. 

Since the createChord and createScale functions included much of the same code, I created two new functions for finding the root frequency given a letter and a number (get_root_frequency), and another function for finding the frequencies of notes based off a root and step counts (get_frequencies), for both equal and just temperament. Additionally, the play function calls the soundsc command in MATLAB, and also delays MATLAB so that subsequent calls to soundsc don't overlap temporally. 

The code includes many play commands, these can be commented or uncommented at will to listen to just the desired sample. 

The plots can be seen by running the hw1.m file, and they are also included in the docx file.