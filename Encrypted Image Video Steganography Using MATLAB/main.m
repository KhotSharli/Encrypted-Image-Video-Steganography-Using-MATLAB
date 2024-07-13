%=== Set directories to store video frames ===%
workingDir = 'frames';
if exist(workingDir, 'dir')
    rmdir(workingDir, 's');
else
    disp('Directory does not exist.');
end

mkdir(workingDir);
mkdir(workingDir,'framesRGB');
mkdir(workingDir,'framesY');
mkdir(workingDir,'framesU');
mkdir(workingDir,'framesV');

%=== Get video reader obj for the video ===%
video = VideoReader("C:\Users\Winster Pereira\Documents\MATLAB\inputvideo.mp4");

%=== construct frames and get their dimensions from the video reader object ===%
%=== store them in these directories ===%
[height, width] = construct_frames(video, workingDir, 'framesRGB', 'framesY', 'framesU', 'framesV');

%=== Get no of frames of the video ===%
noOfFrames = floor(video.FrameRate * video.Duration) - 1;
disp(noOfFrames);

%=== Prompt user for the key ===%
key = input('Enter the key: ');

%=== Scramble the video frames ===%
scramble(key, height, width, noOfFrames, workingDir, 'framesY', 'framesU', 'framesV');
