## FFT_Back_squat: Exercise classifier and appraiser for physiotherapy

### 1. Introduction
------------------
The Fast Fourier transform script written in Matlab formed part of the work conducted in my own Master's thesis on wearable inertial sensors and range of motion metrics in physiotherapy remote support. The abstract of the thesis describes the study as follows.
>The practice of physiotherapy diagnoses patient ailments which are often treated by the daily repetition of prescribed physiotherapeutic exercise. The effectiveness of the exercise regime is dependent on regular daily repetition of the regime and the correct execution of the prescribed exercises. Patients often have issues learning unfamiliar exercises and performing the exercise with good technique.
This design science research study examines a back squat classifier design to appraise patient exercise regime away from the physiotherapy practice. The scope of the exercise appraisal is limited to one exercise, the back squat. Kinematic data captured with commercial inertial sensors is presented to a small group of physiotherapists to illustrate the potential of the technology to measure range of motion (ROM) for back squat appraisal. Opinions are considered from two fields of physiotherapy, general musculoskeletal and post-operative rehabilitation. While the exercise classifier is considered not suitable for post-operative rehabilitation, the opinions expressed for use in general musculoskeletal physiotherapy are positive. 
Kinematic data captured with gyroscope sensors in the sagittal plane is analysed with Matlab to develop a method for back squat exercise recognition and appraisal. The artefact, a back squat classifier with appraisal features is constructed from Matlab scripts which are proven to be effective with kinematic data from a novice athlete.

### 2. Wearable Sensors System
-----------------------------

The wearable system consists of three inertial magnetic measurement units (IMMU) sensors worn on the shank, thigh and sacrum. The motion capture data in the sagittal plane, from the three body segments is written to three separate space delimited files. The IMMUs record absolute angle of the three boby segments at a sampling frequency of 100 Herz.   

![IMMUS][CLOUD]
**Figure 1.** Wearables - back squat motion capture & appraisal system   

From the absolute position of the three body segments, angular velocity and angular acceleration are calculate, their use being necessary for kinematic analysis. A plot of absolute angles of sacrum, thigh and shank are cwhere all three segments commence from zero degrees, proved useful to illustrate the range of angles traversed by each body segment during a single back squat repetition. The photo sequence above the plot also helps to describe the changes of pitch for sacrum, thigh and shank throughout the exercise sequence.   

![squatsequence][PHOTOSEQU]  
**Figure 2.** Back squat time sequence  
![3SEG_ANGLES][ABS_ANGLE]  
**Figure 3.** Sagittal plane back squat exercise IMMU motion capture, relative change in absolute angle (degrees) of body segments against time in 1/100 second samples. Sacrum blue, thigh red, shank green.   

### 3. Kinematic data analysis
--------------------------
The segment plot of relative change of absolute angle (Figure. 3) could be utilised by a decision tree algorithm, however, the number of gradient changes is less than in the plot of angular velocity (Figure 4). When the IMMU data is further processed to create angular velocity of body segments, the number of gradients and gradient direction (sign +/-) changes increases. With the thigh segment there are two distinct gradients in the negative cycle and two gradients in the positive cycle. The gradient in the thigh descent cycle changes direction from negative to positive, and in the ascend cycle the gradient changes from positive to negative
The change in gradient direction, negative to positive, and positive to negative at distinct stages of the back squat exercise give the thigh angular velocity data a strong “signature”. Changes in the gradients of angular velocity correspond to key “stages” of segment kinematics throughout the back squat cycle. Gradients of angular velocity could be analysed by a decision tree algorithm to recognise the kinematic data as back squat exercise and to use slope gradient and duration to qualify the back squat range of motion.
![ANG_VEL][6STAGE_ANG_VEL]   
**Figure 4.** The six discrete stages of back squats in angular velocity for sacrum (blue), thigh (red) and shank (green) in degrees per second.   

>From the sequence of gradients pronounced in the plots of angular velocity, a six stage truth table is constructed. This forms the main body of the classifier and appraisal system. Not only is the classifier able to recognise the back squat exercise and count the number of repetitions, but also by calculating the magnitude and duration of the gradients in each of the six stages, give a qualitative appraisal of the performance. An appraisal method considers the gradients and duration from each body segment in each of the six stages to calculate range of motion. With the application of discrete weights based on the technical importance of each gradient in the six-stage cycle, the appraisal is able reflect the technical merit of the back squat. The calculation of a metric for the sign, degree and duration of the gradient of the sacrum in stage 4, could be multiplied several-fold, to ensure that this quality is clearly present in highly appraised back squats.

>Gradients of angular velocity have the potential to be clearly differentiated by a decision tree algorithm in recognizing kinematic data as back squats exercise and to use slope gradient and duration to qualify the range of motion for sacrum, thigh and shank. Angular velocity gradient slope and duration reduces the burden of the motion capture system to provide highly accurate absolute angle data within the earth frame orientation. If the IMMU is not accurately aligned with the thigh, for example due to the securing elastic strap slipping, then there will be an error in the absolute angle of the body segment. Assuming that the IMMU remains secure for the remaining back squats, this is not critical since while moving out of alignment, the IMMU captures changes in angular velocity. By time duration and angular velocity, the angle through which the thigh traversed is calculated.   

**Table 1.** Back squat truth table for angular velocity of sacrum, thigh and shank   

|Segment|Stage1 Dir/Grad|Stage2 Dir/Grad|Stage3 Dir/Grad|Stage4 Dir/Grad|Stage5 Dir/Grad|Stage6 Dir/Grad|   
|:------|:------:|:------:|:------:|:------:|:------:|:------:|
|Sacrum |	- / - |	- / + |	+ / - |	- / - |	- / + |	+ / - |   
|Thigh  | - / - |	- / + |	- / + |	+ / + |	+ / +	| + / - |    
|Shank	| + / +	| + / - |	- / +	| + / +	| + / + |	+ / - |    
|Time   |18.75%	|18.75%	|20.00%	|10.00%	|12.50%	|20.00%|    

Now that a methodolgy for appraising back squats has been devised, the next problem to address is how to find the start of the back squat cycle. In human gait anaylsis the start of a step is easily observed with a spike in negative acceleration as the heal strikes the floor. In the figure of angular velocity ofsix back squat repetitions it is visible that the plot crosses zero on the vericial access several times between cycles, making finding the start problematic.  
![6BS][6BACKSQUATS]   
**Figure 5.** Thigh angular velocity - sequence of six back squats   

The wearable sensors loaned for this motion capture study failed to record acceleration, thus the analysis is forced to use gyroscope data only, and analysis of absolute angle and its derivatives. Further analysis utilised the second derivative, angular acceleration with FFT to find the time duration of a single back squat cycle. The time of a single back squat is required for segmenting data and exercise recognition with a sliding widow classifier algorithm.   

![ANG_ACC][ANG_ACCEL]   
**Figure 6.** Back squat thigh angular acceleration in degrees per second squared   


ALthought the kinematic data for the study has no accelerometer data, the gyroscope data is cyclical in nature and is suitable for analysis by Fast Fourier Transform (FFT). With the FFT analysis the tim eperiod of the back squat is revealed, allowing hte classifier to segment data, when performing gradient pattern match techniques. The signal processing workflow is described in the flow diagram shown in Figure 7.

![SIG_PROC][SIG_PROC_FLOW]   
**Figure 7.** Gyroscope sensor data signal processing workflow   


### 4. Fast Fourier Transform   

To analyse the back squat absolute position data with the Fourier transform, angular acceleration is calculated using the first central difference method (FCDM). The Fast Fourier Transform (FFT) is based on the Discrete Fourier Transform (DFT), with FFT being preferred since it requires less computation. The results of both transforms are identical, however FFT is more efficient, which is why it is implemented in signal processor hardware and software (Lyons 1997).   
The Fourier transform is a mathematical method to convert a function in the amplitude versus time domain to the amplitude versus frequency domain for non-periodic functions. It does for non-periodic functions what the Fourier series does for periodic functions (van Biezen, 2016.) 
A Matlab script to perform Fast Fourier Transform (FFT) on the angular acceleration of the thigh is described in the following code.
#### 4.1 dlmread   

```sh
THACC=dlmread('MT_00130431_011-001_2ndsquat_TH_CDM_AngularAcceleratation.txt');
% Assign delimited read text file, name of THACC. 
% Calculate starting point of 2nd squat
% SAcrum THigh and SHank motion data start at sample 19264. 
x=THACC(:,1);   % All values column 1, sample #
x=(x-19263);    % 2nd Squat_011-001.txt sample counter starts at 19264 
y=THACC(:,8);   % Column 8. Thigh angular acceleration in degrees/s/s
```
The dlmread in the first part of the FFT script reads values of thigh angular acceleration, THACC from column 8 in a delimted text file. The : wildcard demotes all values of the column are read and plot in the verticle axis. The time values in colum 1 are plot in the horizontal axis, their value has 19263 subtracted, the time sample when th eback squat starts.   

#### 4.2 Fs -Sampling Frequency
```sh
Fs = 100;       % Sampling frequency 100Hz   
```
The sampling frequency is the number of discrete signal amplitude values taken per second. In this case one hundred samples of angular acceleration per second.   






[CLOUD]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/Wearables_cloud.png   
[PHOTOSEQU]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/photosequence.png
[ABS_ANGLE]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/absolute_angle.png
[6STAGE_ANG_VEL]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/good_squat_6stages.png
[6BACKSQUATS]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/6backsquats_ang_vel.png 
[ANG_ACCEL]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/backsquat_ang_accel.jpg 
[SIG_PROC_FLOW]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/workflow_signal_proc.png

