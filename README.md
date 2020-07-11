# RandomCliqueComplexes_ICML2018

### About
This is a source code for our [ICML 2018](https://icml.cc/Conferences/2018) paper: [Solving Partial Assignment Problems using Random Clique Complexes](http://proceedings.mlr.press/v80/sharma18a).

### Requirements
This code is developed in 
```
MATLAB R2017b
```
### Dataset
We used five different datasets for evaluation. The dataset names are:
- CMU House
- CMU Hotel
- Car
- Bike
- Butterfly
- Magazine
- Building
- Book

### Usage
To run the matching model to generate results for "House" dataset for pairwise matching of 111 images, run:
```
main.m
```
## **Example of higher order matchings**
![image](https://user-images.githubusercontent.com/15656698/63844577-170d1c00-c9a6-11e9-927f-99886ea86a21.png)
## **Result of matchings on House dataset images**
![image](https://user-images.githubusercontent.com/15656698/63844422-d2818080-c9a5-11e9-8243-b72977b9e92c.png)

### Citation
Please cite the paper if you use this code.
```
@InProceedings{pmlr-v80-sharma18a,
  title = 	 {Solving Partial Assignment Problems using Random Clique Complexes},
  author = 	 {Sharma, Charu and Nathani, Deepak and Kaul, Manohar},
  booktitle = 	 {Proceedings of the 35th International Conference on Machine Learning},
  pages = 	 {4586--4595},
  year = 	 {2018},
  editor = 	 {Dy, Jennifer and Krause, Andreas},
  volume = 	 {80},
  series = 	 {Proceedings of Machine Learning Research},
  address = 	 {Stockholmsmässan, Stockholm Sweden},
  month = 	 {10--15 Jul},
  publisher = 	 {PMLR},
  pdf = 	 {http://proceedings.mlr.press/v80/sharma18a/sharma18a.pdf},
  url = 	 {http://proceedings.mlr.press/v80/sharma18a.html}
}

```
