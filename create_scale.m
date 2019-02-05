function [soundOut] = create_scale( scaleType, temperament, root, constants )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION
%    [ soundOut ] = create_scale( scaleType,temperament, root, constants )
% 
% This function creates the sound output given the desired type of scale
%
% OUTPUTS
%   soundOut = The output sound vector
%
% INPUTS
%   scaleType = Must support 'Major' and 'Minor' at a minimum
%   temperament = may be 'just' or 'equal'
%   root = The Base frequeny (expressed as a letter followed by a number
%       where A4 = 440 (the A above middle C)
%       See http://en.wikipedia.org/wiki/Piano_key_frequencies for note
%       numbers and frequencies
%   constants = the constants structure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T = 1/constants.fs;
len = constants.durationScale;
soundOut = [];
root_freq = get_root_frequency(root);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


switch scaleType
    case {'Major','major','M','Maj','maj'}
        steps = [0 2 4 5 7 9 11 12]; % root, whole, whole, half, etc
    case {'Minor','minor','m','Min','min'}
        steps = [0 2 3 5 7 8 10 12];
    case {'Harmonic', 'harmonic', 'Harm', 'harm'}
        steps = [0 2 3 5 7 8 11 12];
    case {'Melodic', 'melodic', 'Mel', 'mel'}
	% EXTRA CREDIT
    otherwise
        error('Inproper scale specified');
end

freqs = get_frequencies(steps, temperament, root_freq);

for i = 1:8
    x = 0:T:len - T;
    envelope = (sin(2 * pi * x * (1/(2*len)))).^(1/2); % simple window function
    y = sin(2 * pi * x * freqs(i) );
    soundOut = [soundOut y.*envelope]; % creating one long vector
end
