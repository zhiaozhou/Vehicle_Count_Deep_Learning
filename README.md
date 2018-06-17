# Vehicle_Count_CNN

Team Members
=====
| Member | Email | Github |
| :--: | :--: | :--: |
| Zhiao Zhou | <zz1749@nyu.edu> | <https://github.com/zhiaozhou> |
| Julian Ferreiro | <julian.ferreiro@nyu.edu> | <https://github.com/jif245> |
| Lingyi Zhang | <lingyi.zhang@nyu.edu> | <https://github.com/lingyielia> |

Description
=====
Traffic count is the fundamental element of transportation-related studies. Although traffic counting has been widely studied, more effort is on annually traffic estimation based on collected daily traffic counts, rather than improving accuracy and efficiency of the raw data collection. Moreover, most of people are still collecting traffic density data manually instead of using machines. We successfully implemented two CNN-based models (classification and object detection) for detecting vehicle numbers in images: Inception Resnet V2 (Model 1) and Faster RCNN with Inception Resnet V2  (Model 2). In model 1, Inception Resnet V2 was used to classify the vehicle counts ranging from 0 to 41. In model 2, we first conducted detection of cars using Faster RCNN with Inception Resnet V2 and then count the frequency of detections in each image. In this way, traffic counts can be conducted automatically and in real-time using pre-installed traffic cameras, which could largely reduce expenses on labor as well as extra equipment installation and maintenance.  
**The main commands can be found in the main.sh script.**

Demo
=====
This project also contains a demo website that shows how our model works which is yielded by Demo_Detection.ipynb
We tested our models on a traffic cam from 6th Avenue, Manhattan, New York
<p float="center">
    <img src="./Examples/example1.gif" alt="Drawing" style="width: 900px;" width="300"/> 
    <img src="./Examples/example2.gif" alt="Drawing" style="width: 900px;" width="300"/>
</p>

Paper
=====
You can find the pdf file of our final paper [here](./Paper/FinalReport.pdf)
