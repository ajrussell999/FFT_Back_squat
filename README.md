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



[CLOUD]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/Wearables_cloud.png   
[PHOTOSEQU]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/photosequence.png
[ABS_ANGLE]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/absolute_angle.png
[6STAGE_ANG_VEL]:https://github.com/ajrussell999/FFT_Back_squat/blob/master/images/good_squat_6stages.png


