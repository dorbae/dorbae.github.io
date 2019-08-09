---
layout: post
title: "[Android] Bar chart is not visible, nevertheless values of it are visible in MPAndroidChart"
comments: true
author: dorbae
date: 2019-08-09 +0900
categories : [Android,MPAndroidChart]
tags: [android,mpandroidchart,troubleshooting]
sitemap :
  changefreq : weekly
---

# Goal
* Solve the problem which bars are not visible in chart

<br />

# Problem
* Environment
  * Development
    * Android Studio 3.2.1
    * Compile/Target SDK : 28
    * Minimum SDJ : 17
  * Test
    * Xiaomi MI MAX 2
    * Android 7.1.1
  * MPAndroidChart 3.1.0
    
* I drew combined graph and the values of bar chart displayed well.
* But, the bars didn't displayed despite of replacing the width of bar trough ***BarData.setBarWidth(float)*** method

<br />

![screenshoot001](/assets/images/posts/2019/08/2019-08-09-android-mpandroidchart-barchartnotvisible-001.png)

<br />

# Solution

## Cause
* I was using millisecond as the unit of X axis
* The bars were too thin to be not visible. It was becuase the library drew bars with 1 millisecond width
* So, you have to replace the unit of values in X asis with minute or bigger than minute

<br />

* My Code

``` java

private static final SimpleDateFormat DISP_SDF_DAY_OF_WEEK = new SimpleDateFormat("E", Locale.getDefault());
private static final SimpleDateFormat INFLUXDB_UTC_SDF = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

...

XAxis xAxis = this.chart.getXAxis();
xAxis.setValueFormatter(new ValueFormatter() {
    @Override
    public String getFormattedValue(float value) {
        //
        // Problem
        //
        return DISP_SDF_DAY_OF_WEEK.format(Float.valueOf(value).longValue() * 1000L);
    }
});

...

BarDataSet barDataSet;
YAxis barYAxis = this.chart.getAxis(YAxis.AxisDependency.LEFT);
barYAxis.setPosition(YAxis.YAxisLabelPosition.OUTSIDE_CHART);
barYAxis.setDrawGridLines(false);
barYAxis.setTextColor(android.R.color.black);
barYAxis.setSpaceTop(15f);
barYAxis.setAxisMinimum(0f);
List<BarEntry> barEntryList = new ArrayList<>();
BarEntry barEntry;

ArrayList<Object> list;
long time;
Object temp;
float mean;
try {
    for (int ll = 0; ll < values.length; ll++) {
        list = (ArrayList<Object>) values[ll];

        //
        // Problem
        //
        time = INFLUXDB_UTC_SDF.parse((String) list.get(0)).getTime() / 1000L;  // eg. 2019-08-07T00:00:00Z

        temp = list.get(1);
        if (temp instanceof java.lang.Double) {
            mean = ((Double) temp).floatValue();
        } else if (temp instanceof java.lang.Integer) {
            mean = ((Integer) temp).floatValue();
        } else {
            mean = (float) temp;
        }
        
        barEntry = new BarEntry(time, (int) list.get(2));
        barEntryList.add(barEntry);
    }
} catch (java.text.ParseException e) {
    Log.e("dorbae", e.getMessage(), e);
}

barDataSet = new BarDataSet(barEntryList, "Accumulation");
barDataSet.setColor(getResources().getColor(R.color.colorPrimary));
barDataSet.setValueTextColor(getResources().getColor(R.color.colorPrimary));
barDataSet.setAxisDependency(YAxis.AxisDependency.LEFT);
barDataSet.setVisible(true);
barDataSet.setDrawIcons(false);

BarData barData = new BarData(barDataSet);
//
// It didn't work well because of other reason
//
barData.setBarWidth(30f);

Legend l = this.chart.getLegend();
l.setDrawInside(true);
l.setVerticalAlignment(Legend.LegendVerticalAlignment.BOTTOM);
l.setHorizontalAlignment(Legend.LegendHorizontalAlignment.RIGHT);
l.setTextColor(Color.BLACK);

CombinedData combinedData = new CombinedData();
combinedData.setData(barData);
combinedData.setData(lineData);
this.chart.setData(combinedData);
this.chart.getAxisLeft().setEnabled(true);
this.chart.setVisibility(View.VISIBLE);
this.chart.invalidate();
this.chart.notifyDataSetChanged();

...

```

## 1. Change the unit of x value as hour

* MyCode

``` java

...

xAxis.setValueFormatter(new ValueFormatter() {
    @Override
    public String getFormattedValue(float value) {
        //
        // Solved 
        //
        return DISP_SDF_DAY_OF_WEEK.format(Float.valueOf(value).longValue() * 1000L * 60L * 60L);
    }
});

...

try {
    for (int ll = 0; ll < values.length; ll++) {
        list = (ArrayList<Object>) values[ll];

        //
        // Solved (second -> hour)
        //
        time = INFLUXDB_UTC_SDF.parse((String) list.get(0)).getTime() / 1000L / 60L / 60L);  // eg. 2019-08-07T00:00:00Z

        ...
    }
} 

...

```

![screenshoot002](/assets/images/posts/2019/08/2019-08-09-android-mpandroidchart-barchartnotvisible-002.png)

<br />

-------------

## References
* [MPAndroidChart GitHub](https://github.com/PhilJay/MPAndroidChart/issues/2892)
