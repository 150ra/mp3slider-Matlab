function [message] = mp3slider(name,duration,fs_output)
%   mp3slider 
%   Slide one mp3 to x wav files with wanted duration (in seconds)

filename=uigetfile;
[y,fs]=audioread(filename);
t_len=length(y)*(1/fs);
    %Change fs if need it
    if fs~=fs_output
        [p,q] = rat(fs_output/fs,0.0001);
        y = resample(y,p,q);
    end
 
n_loop=floor(t_len/duration)-1; %number of loops
n_samples=duration*fs_output; %samples of input duration
    for i=0:n_loop
        writename='XC'+string(name)+'.wav';
        gong = audioplayer(y(1+i*n_samples:1+(i+1)*n_samples), fs_output);
        play(gong)
        bird=input('There is bird?');
        if bird
            audiowrite(writename,y(1+i*n_samples:1+(i+1)*n_samples),fs_output)
            name=name+1;
        end
        pause(gong)
    end
message="wavs created";
end

