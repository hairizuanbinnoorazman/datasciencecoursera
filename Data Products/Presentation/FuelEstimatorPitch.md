Fuel Estimator
========================================================
author: Hairizuan Bin Noorazman
date: 24 January 2015

Introduction
========================================================

If you are travelling from New York to Boston, won't you need to know how much fuel you would need to stock up?

However, the amount required varies from car to car; a general estimate just won't do!!


Fuel Estimator Tool
========================================================

In order to get a good estimate of the fuel required, we used 


```
                   mpg cyl disp  hp am
Mazda RX4         21.0   6  160 110  1
Mazda RX4 Wag     21.0   6  160 110  1
Datsun 710        22.8   4  108  93  1
Hornet 4 Drive    21.4   6  258 110  0
Hornet Sportabout 18.7   8  360 175  0
```

This is just a subset of the mtcars dataset

How it works?
========================================================

A linear regression based on several identifiable factors such as:
- Number of cylinders
- Auto/Manual transmision
- Displacement amount
- Horsepower

Some of these values are the ones that people identify best.


The outputs of the tool
===

This tool would provide two outputs
- The miles per gallon of the vehicle (This is just an estimate. 
The actual miles per gallon of the vehicle changes over time and 
the condition of the vehicle)
- The estimated number of gallons of fuels required to travel from
New York to Boston (vice versa)
