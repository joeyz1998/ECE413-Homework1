function [soundOut] = create_chord( chordType,temperament, root, constants )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
%    [ soundOut ] = create_scale( chordType,temperament, root, constants )
% 
% This function creates the sound output given the desired type of chord
%
% OUTPUTS
%   soundOut = The output sound vector
%
% INPUTS
%   chordType = Must support 'Major' and 'Minor' at a minimum
%   temperament = may be 'just' or 'equal'
%   root = The Base frequeny (expressed as a letter followed by a number
%       where A4 = 440 (the A above middle C)
%       See http://en.wikipedia.org/wiki/Piano_key_frequencies for note
%       numbers and frequencies
%   constants = the constants structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 1/constants.fs;
len = constants.durationChord;
soundOut = [];
root_freq = get_root_frequency( root );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


switch chordType
    case {'Major','major','M','Maj','maj'}
        notes = [ 0 4 7 ]; % 1 3 5 notes, means 1 4 7 steps of major scale
    case {'Minor','minor','m','Min','min'}
        notes = [ 0 3 7 ];
    case {'Power','power','pow'}
        notes = [ 0 7 ]; % the root and the fifth
    case {'Sus2','sus2','s2','S2'}
        notes = [ 0 2 7 ]; % 1st, 2nd, 5th or major
    case {'Sus4','sus4','s4','S4'}
        notes = [ 0 5 7 ]; % 1st, 4th and 5th
    case {'Dom7','dom7','Dominant7', '7'}
        notes = [ 0 4 7 10 ];
    case {'Min7','min7','Minor7', 'm7'}
        notes = [ 0 3 7 10 ];
    otherwise
        error('Inproper chord specified');
end

freqs = get_frequencies( notes, temperament, root_freq );

x = 0:T:len - T;
[t, f] = meshgrid(x, freqs);
y = sum(sin(2 * pi .* f .* t));
soundOut = y;


end
