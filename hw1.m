%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SCRIPT
%    hw1
% 
% This script runs questions 2 through 4 of the HW1 from ECE313:Music and
% Engineering.
%
% This script was adapted from hw1 recevied in 2012
%
% Edited by Daniel Zuerbig, Feb 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clear all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
constants.fs=44100;                 % Sampling rate in samples per second
constants.durationScale=0.5;        % Duration of notes in a scale
constants.durationChord=2;          % Duration of chords



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2 - scales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[soundMajorScaleJust]=create_scale('Major','Just','A3',constants);
[soundMajorScaleEqual]=create_scale('Major','Equal','A3',constants);
[soundMinorScaleJust]=create_scale('Minor','Just','A3',constants);
[soundMinorScaleEqual]=create_scale('Minor','Equal','A3',constants);

disp('Playing the Equal Tempered Major Scale');
play(soundMajorScaleEqual,constants.fs);
disp('Playing the Equal Tempered Minor Scale');
play(soundMinorScaleEqual,constants.fs);
disp('Playing the Just Tempered Major Scale');
play(soundMajorScaleJust,constants.fs);
disp('Playing the Just Tempered Minor Scale');
play(soundMinorScaleJust,constants.fs);
fprintf('\n');

% EXTRA CREDIT - Melodic and Harmonic scales
[soundHarmScaleJust]=create_scale('Harmonic','Just','A3',constants);
[soundHarmScaleEqual]=create_scale('Harmonic','Equal','A3',constants);

% I programmed in the Harmonic chords, so the following lines can be
% uncommented to take a listen.

disp('Playing the Just Tempered Harmonic Scale');
play(soundHarmScaleJust,constants.fs);
disp('Playing the Equal Tempered Harmonic Scale');
play(soundHarmScaleEqual,constants.fs);
fprintf('\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3 - chords
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fund = 'A3'; % need this to determine wavelength for plots

% major and minor chords
[soundMajorChordJust]=create_chord('Major','Just',fund,constants);
[soundMajorChordEqual]=create_chord('Major','Equal',fund,constants);
[soundMinorChordJust]=create_chord('Minor','Just',fund,constants);
[soundMinorChordEqual]=create_chord('Minor','Equal',fund,constants);

disp('Playing the Equal Tempered Major Chord');
play(soundMajorChordEqual,constants.fs);
disp('Playing the Equal Tempered Minor Chord');
play(soundMinorChordEqual,constants.fs);
disp('Playing the Just Tempered Major Chord');
play(soundMajorChordJust,constants.fs);
disp('Playing the Just Tempered Minor Chord');
play(soundMinorChordJust,constants.fs);
fprintf('\n');

% assorted other chords
[soundPowerChordJust]=create_chord('Power','Just',fund,constants);
[soundPowerChordEqual]=create_chord('Power','Equal',fund,constants);
[soundSus2ChordJust]=create_chord('Sus2','Just',fund,constants);
[soundSus2ChordEqual]=create_chord('Sus2','Equal',fund,constants);
[soundSus4ChordJust]=create_chord('Sus4','Just',fund,constants);
[soundSus4ChordEqual]=create_chord('Sus4','Equal',fund,constants);
[soundDom7ChordJust]=create_chord('Dom7','Just',fund,constants);
[soundDom7ChordEqual]=create_chord('Dom7','Equal',fund,constants);
[soundMin7ChordJust]=create_chord('Min7','Just',fund,constants);
[soundMin7ChordEqual]=create_chord('Min7','Equal',fund,constants);


% The following lines can be uncommented to take a listen to the other
% chords

% disp('Playing the Equal Tempered Power Chord');
% play(soundPowerChordEqual,constants.fs);
% disp('Playing the Equal Tempered Sus2 Chord');
% play(soundSus2ChordEqual,constants.fs);
% disp('Playing the Equal Tempered Sus4 Chord');
% play(soundSus2ChordEqual,constants.fs);
% disp('Playing the Equal Tempered Dom7 Chord');
% play(soundDom7ChordEqual,constants.fs);
% disp('Playing the Equal Tempered Min7 Chord');
% play(soundMin7ChordEqual,constants.fs);
% disp('Playing the Just Tempered Power Chord');
% play(soundPowerChordJust,constants.fs);
% disp('Playing the Just Tempered Sus2 Chord');
% play(soundSus2ChordJust,constants.fs);
% disp('Playing the Just Tempered Sus4 Chord');
% soundsc(soundSus2ChordJust,constants.fs);
% disp('Playing the Just Tempered Dom7 Chord');
% soundsc(soundDom7ChordJust,constants.fs);
% disp('Playing the Just Tempered Min7 Chord');
% soundsc(soundMin7ChordJust,constants.fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 4 - plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% determine fundamental frequency
root_f = get_root_frequency(fund);
x = 0:(1/constants.fs):constants.durationChord - (1/constants.fs);

% major, minor
% just, equal


figure
subplot(2,2,[1,2])
plot(x, soundMajorChordEqual)
title('Major Chord in equal temperment')
axis([0 1/root_f -3 3])
subplot(2,2,[3,4])
plot(x, soundMajorChordEqual)
axis([0 20/root_f -3 3])

figure
subplot(2,2,[1,2])
plot(x, soundMinorChordEqual)
title('Minor Chord in equal temperment')
axis([0 1/root_f -3 3])
subplot(2,2,[3,4])
plot(x, soundMinorChordEqual)
axis([0 20/root_f -3 3])

figure
subplot(2,2,[1,2])
plot(x, soundMajorChordJust)
title('Major Chord in just temperment')
axis([0 1/root_f -3 3])
subplot(2,2,[3,4])
plot(x, soundMajorChordJust)
axis([0 20/root_f -3 3])

figure
subplot(2,2,[1,2])
plot(x, soundMinorChordJust)
title('Minor Chord in just temperment')
axis([0 1/root_f -3 3])
subplot(2,2,[3,4])
plot(x, soundMinorChordJust)
axis([0 20/root_f -3 3])


