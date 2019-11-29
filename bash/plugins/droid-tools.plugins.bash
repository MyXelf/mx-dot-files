#
#  DROID-TOOLS - Android Tools Suite [BASH script version]
#
#  author    Juan J Gonzalez Cardenas [Jota Jota] - <https://github.com/MyXelf/mx-dot-files>
#  version   1.0.0.7
#  date      20.Mar.2015
#
#  legal     Copyright (c) 2012-2019. Licensed under the MIT license.
#

#
# Function: asdk()
#
# Display information about the Android Software Development Kit
#
asdk () {
  e_hr 'Android Tools Suite' 'Software Development Kit' '\n'

  echo "Android development happens around families of releases, which use code names ordered alphabetically after tasty treats."
  echo "The code names match the following version numbers, along with API levels and NDK releases provided for convenience:"
  echo

  e_cm "Code Name             Version         API Level"
  for api_level in "${aapi_level[@]}"; do
    e_ac "$api_level"
  done

  echo
  e_cm "Reference: https://source.android.com/source/build-numbers.html"

  [[ $1 != '-v' && $1 != '--verbose' ]] && return $E_SUCCESS

  # Source Code Tags and Builds
  echo
  echo 'Starting with Donut, the exact list of Tags and Builds is in the following table:'
  echo

  (
    e_cm 'Build              | Branch                 | Version            | Sec Patch Lvl | Supported Devices'
    e_ac 'QD1A.190821.014.C2 | android-10.0.0_r14     | Android 10         | 2019-11-05    | Pixel 4 XL, Pixel 4'
    e_ac 'QD1A.190821.014    | android-10.0.0_r13     | Android 10         | 2019-11-05    | Pixel 4 XL, Pixel 4'
    e_ac 'QD1A.190821.007.A3 | android-10.0.0_r12     | Android 10         | 2019-11-05    | Pixel 4 XL, Pixel 4'
    e_ac 'QP1A.191105.004    | android-10.0.0_r11     | Android 10         | 2019-11-05    | Pixel 2 XL, Pixel 2'
    e_ac 'QP1A.191105.003    | android-10.0.0_r10     | Android 10         | 2019-11-05    | Pixel 3a XL, Pixel 3a, Pixel 3 XL, Pixel 3'
    e_ac 'QD1A.190821.011.C4 | android-10.0.0_r9      | Android 10         | 2019-10-05    | Pixel 4 XL, Pixel 4'
    e_ac 'QD1A.190821.011    | android-10.0.0_r8      | Android 10         | 2019-10-05    | Pixel 4 XL, Pixel 4'
    e_ac 'QD1A.190821.007    | android-10.0.0_r7      | Android 10         | 2019-10-05    | Pixel 4 XL, Pixel 4'
    e_ac '5933585            | android-10.0.0_r6      | Android 10         | 2019-09-05    | -'
    e_ac 'QP1A.191005.007.A1 | android-10.0.0_r5      | Android 10         | 2019-10-06    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'QP1A.191005.007    | android-10.0.0_r4      | Android 10         | 2019-10-05    | Pixel 3a XL, Pixel 3a, Pixel 3 XL, Pixel 3'
    e_ac 'QP1A.190711.020.C3 | android-10.0.0_r3      | Android 10         | 2019-09-05    | Pixel 3a XL, Pixel 3a, Pixel 3 XL, Pixel 3'
    e_ac 'QP1A.190711.020    | android-10.0.0_r2      | Android 10         | 2019-09-05    | Pixel 3a XL, Pixel 3a, Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'QP1A.190711.019    | android-10.0.0_r1      | Android 10         | 2019-09-05    | Pixel 3a XL, Pixel 3a, Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac '5887210            | android-9.0.0_r50      | Pie                | 2018-08-05    | -'
    e_ac '5794013            | android-9.0.0_r49      | Pie                | 2018-08-05    | -'
    e_ac '5748468            | android-9.0.0_r48      | Pie                | 2018-08-05    | -'
    e_ac 'PQ3B.190801.002    | android-9.0.0_r47      | Pie                | 2019-08-01    | Pixel 3a XL, Pixel 3a'
    e_ac 'PQ3A.190801.002    | android-9.0.0_r46      | Pie                | 2019-08-01    | Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'PQ3B.190705.003    | android-9.0.0_r45      | Pie                | 2019-07-05    | Pixel 3a XL, Pixel 3a'
    e_ac 'PQ3A.190705.003    | android-9.0.0_r44      | Pie                | 2019-07-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PQ3A.190705.001    | android-9.0.0_r43      | Pie                | 2019-07-05    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'PQ3B.190605.006    | android-9.0.0_r42      | Pie                | 2019-06-05    | Pixel 3a XL, Pixel 3a'
    e_ac 'PQ3A.190605.004.A1 | android-9.0.0_r41      | Pie                | 2019-06-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PQ3A.190605.003    | android-9.0.0_r40      | Pie                | 2019-06-05    | Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'PD2A.190115.032    | android-9.0.0_r39      | Pie                | 2019-03-05    | Pixel 3a XL, Pixel 3a'
    e_ac 'PD2A.190115.029    | android-9.0.0_r38      | Pie                | 2019-03-05    | Pixel 3a XL, Pixel 3a'
    e_ac 'PQ3A.190505.002    | android-9.0.0_r37      | Pie                | 2019-05-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PQ3A.190505.001    | android-9.0.0_r36      | Pie                | 2019-05-05    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'PQ2A.190405.003    | android-9.0.0_r35      | Pie                | 2019-04-05    | Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'PQ2A.190305.002    | android-9.0.0_r34      | Pie                | 2019-03-05    | Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'PQ2A.190205.003    | android-9.0.0_r33      | Pie                | 2019-02-05    | Pixel XL, Pixel'
    e_ac 'PQ2A.190205.002    | android-9.0.0_r32      | Pie                | 2019-02-05    | Pixel 2 XL, Pixel 2'
    e_ac 'PQ2A.190205.001    | android-9.0.0_r31      | Pie                | 2019-02-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PQ1A.190105.004    | android-9.0.0_r30      | Pie                | 2019-01-05    | Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'PQ1A.181205.006.A1 | android-9.0.0_r22      | Pie                | 2018-12-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PQ1A.181205.006    | android-9.0.0_r21      | Pie                | 2018-12-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PQ1A.181205.002.A1 | android-9.0.0_r20      | Pie                | 2018-12-05    | Pixel XL, Pixel'
    e_ac 'PQ1A.181205.002    | android-9.0.0_r19      | Pie                | 2018-12-05    | Pixel 2 XL, Pixel 2'
    e_ac 'PPR2.181005.003.A1 | android-9.0.0_r18      | Pie                | 2018-11-01    | Pixel XL, Pixel'
    e_ac 'PPR1.181005.003.A1 | android-9.0.0_r17      | Pie                | 2018-11-01    | Pixel XL, Pixel'
    e_ac 'PQ1A.181105.017.A1 | android-9.0.0_r16      | Pie                | 2018-11-05    | Pixel 3 XL, Pixel 3, Pixel 2 XL, Pixel 2'
    e_ac 'PD1A.180720.031    | android-9.0.0_r12      | Pie                | 2018-09-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PD1A.180720.030    | android-9.0.0_r11      | Pie                | 2018-09-05    | Pixel 3 XL, Pixel 3'
    e_ac 'PPR2.181005.003    | android-9.0.0_r10      | Pie                | 2018-10-05    | Pixel XL, Pixel, Pixel 2 XL, Pixel 2'
    e_ac 'PPR1.181005.003    | android-9.0.0_r9       | Pie                | 2018-10-05    | Pixel XL, Pixel'
    e_ac 'PPR2.180905.006.A1 | android-9.0.0_r8       | Pie                | 2018-09-05    | Pixel XL, Pixel'
    e_ac 'PPR2.180905.006    | android-9.0.0_r7       | Pie                | 2018-09-05    | Pixel XL, Pixel'
    e_ac 'PPR2.180905.005    | android-9.0.0_r6       | Pie                | 2018-09-05    | Pixel 2 XL, Pixel 2'
    e_ac 'PPR1.180905.003    | android-9.0.0_r5       | Pie                | 2018-09-05    | Pixel XL, Pixel'
    e_ac 'PPR1.180610.011    | android-9.0.0_r3       | Pie                | 2018-08-05    | Pixel 2 XL, Pixel 2'
    e_ac 'PPR1.180610.010    | android-9.0.0_r2       | Pie                | 2018-08-05    | Pixel XL, Pixel'
    e_ac 'PPR1.180610.009    | android-9.0.0_r1       | Pie                | 2018-08-05    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac '5887208            | android-8.1.0_r70      | Oreo               | 2017-12-05    | -'
    e_ac '5794017            | android-8.1.0_r69      | Oreo               | 2017-12-05    | -'
    e_ac '5725752            | android-8.1.0_r68      | Oreo               | 2017-12-05    | -'
    e_ac 'OPM8.190605.005    | android-8.1.0_r67      | Oreo               | 2019-06-05    | Pixel C'
    e_ac '5650812            | android-8.1.0_r66      | Oreo               | 2017-12-05    | -'
    e_ac 'OPM8.190605.003    | android-8.1.0_r65      | Oreo               | 2019-06-05    | Pixel C'
    e_ac 'OPM8.190505.001    | android-8.1.0_r64      | Oreo               | 2019-05-05    | Pixel C'
    e_ac 'OPM8.190405.001    | android-8.1.0_r63      | Oreo               | 2019-04-05    | Pixel C'
    e_ac 'OPM8.190305.001    | android-8.1.0_r62      | Oreo               | 2019-03-05    | Pixel C'
    e_ac 'OPM8.190205.001    | android-8.1.0_r61      | Oreo               | 2019-02-05    | Pixel C'
    e_ac 'OPM8.190105.002    | android-8.1.0_r60      | Oreo               | 2019-01-05    | Pixel C'
    e_ac 'OPM8.181205.001    | android-8.1.0_r53      | Oreo               | 2018-12-05    | Pixel C'
    e_ac 'OPM7.181205.001    | android-8.1.0_r52      | Oreo               | 2018-12-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM8.181105.002    | android-8.1.0_r51      | Oreo               | 2018-11-05    | Pixel C'
    e_ac 'OPM7.181105.004    | android-8.1.0_r50      | Oreo               | 2018-11-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM8.181005.003    | android-8.1.0_r48      | Oreo               | 2018-10-05    | Pixel C'
    e_ac 'OPM7.181005.003    | android-8.1.0_r47      | Oreo               | 2018-10-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM6.171019.030.K1 | android-8.1.0_r46      | Oreo               | 2018-09-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM4.171019.021.Z1 | android-8.1.0_r45      | Oreo               | 2018-09-05    | Pixel C'
    e_ac 'OPM6.171019.030.H1 | android-8.1.0_r43      | Oreo               | 2018-08-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM4.171019.021.Y1 | android-8.1.0_r42      | Oreo               | 2018-08-05    | Pixel C'
    e_ac 'OPM6.171019.030.E1 | android-8.1.0_r41      | Oreo               | 2018-07-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM4.171019.021.R1 | android-8.1.0_r40      | Oreo               | 2018-07-05    | Pixel 2 XL'
    e_ac 'OPM4.171019.021.Q1 | android-8.1.0_r39      | Oreo               | 2018-07-05    | Pixel 2'
    e_ac 'OPM4.171019.021.P1 | android-8.1.0_r38      | Oreo               | 2018-07-05    | Pixel, Pixel XL'
    e_ac 'OPM4.171019.021.N1 | android-8.1.0_r37      | Oreo               | 2018-07-05    | Pixel C'
    e_ac 'OPM2.171026.006.H1 | android-8.1.0_r36      | Oreo               | 2018-07-05    | Pixel 2 XL'
    e_ac 'OPM2.171026.006.G1 | android-8.1.0_r35      | Oreo               | 2018-07-05    | Pixel 2'
    e_ac 'OPM6.171019.030.B1 | android-8.1.0_r33      | Oreo               | 2018-06-05    | Nexus 6P, Nexus 5X'
    e_ac 'OPM4.171019.021.E1 | android-8.1.0_r32      | Oreo               | 2018-06-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPM4.171019.021.D1 | android-8.1.0_r31      | Oreo               | 2018-06-05    | Pixel XL, Pixel'
    e_ac 'OPM2.171026.006.C1 | android-8.1.0_r30      | Oreo               | 2018-06-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPM4.171019.016.C1 | android-8.1.0_r29      | Oreo               | 2018-05-05    | Pixel C'
    e_ac 'OPM4.171019.016.B1 | android-8.1.0_r28      | Oreo               | 2018-05-05    | Pixel XL, Pixel, Pixel 2 XL, Pixel 2'
    e_ac 'OPM4.171019.016.A1 | android-8.1.0_r27      | Oreo               | 2018-05-05    | Nexus 5X'
    e_ac 'OPM2.171019.029.B1 | android-8.1.0_r26      | Oreo               | 2018-05-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPM2.171019.029.A1 | android-8.1.0_r25      | Oreo               | 2018-05-05    | Nexus 6P'
    e_ac 'OPM4.171019.015.A1 | android-8.1.0_r23      | Oreo               | 2018-04-01    | Pixel 2 XL, Pixel 2'
    e_ac 'OPM5.171019.019    | android-8.1.0_r22      | Oreo               | 2018-04-01    | Nexus 6P'
    e_ac 'OPM3.171019.019    | android-8.1.0_r21      | Oreo               | 2018-04-01    | Nexus 6P'
    e_ac 'OPM2.171019.029    | android-8.1.0_r20      | Oreo               | 2018-04-05    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel, Nexus 5X'
    e_ac 'OPM1.171019.026    | android-8.1.0_r19      | Oreo               | 2018-04-05    | Pixel C'
    e_ac 'OPM5.171019.017    | android-8.1.0_r18      | Oreo               | 2018-03-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM3.171019.016    | android-8.1.0_r17      | Oreo               | 2018-03-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM1.171019.022.A1 | android-8.1.0_r16      | Oreo               | 2018-03-05    | Pixel C'
    e_ac 'OPM1.171019.021    | android-8.1.0_r15      | Oreo               | 2018-03-05    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'OPM5.171019.015    | android-8.1.0_r14      | Oreo               | 2018-02-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM3.171019.014    | android-8.1.0_r13      | Oreo               | 2018-02-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM1.171019.019    | android-8.1.0_r12      | Oreo               | 2018-02-05    | Pixel 2'
    e_ac 'OPM1.171019.018    | android-8.1.0_r11      | Oreo               | 2018-02-05    | Pixel 2 XL'
    e_ac 'OPM1.171019.016    | android-8.1.0_r10      | Oreo               | 2018-02-05    | Pixel, Pixel XL, Pixel C'
    e_ac 'OPM5.171019.014    | android-8.1.0_r9       | Oreo               | 2018-01-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM2.171019.016    | android-8.1.0_r8       | Oreo               | 2018-01-05    | Pixel 2'
    e_ac 'OPM3.171019.013    | android-8.1.0_r7       | Oreo               | 2018-01-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPM1.171019.015    | android-8.1.0_r6       | Oreo               | 2018-01-05    | Pixel C'
    e_ac 'OPM1.171019.014    | android-8.1.0_r5       | Oreo               | 2018-01-05    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel'
    e_ac 'OPM1.171019.013    | android-8.1.0_r4       | Oreo               | 2018-01-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPM1.171019.012    | android-8.1.0_r3       | Oreo               | 2018-01-05    | Pixel XL, Pixel'
    e_ac 'OPM2.171019.012    | android-8.1.0_r2       | Oreo               | 2017-12-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPM1.171019.011    | android-8.1.0_r1       | Oreo               | 2017-12-05    | Pixel 2 XL, Pixel 2, Pixel XL, Pixel, Pixel C, Nexus 6P, Nexus 5X'
    e_ac '5887206            | android-8.0.0_r40      | Oreo               | 2017-10-01    | -'
    e_ac '5796467            | android-8.0.0_r39      | Oreo               | 2017-10-01    | -'
    e_ac '5729099            | android-8.0.0_r38      | Oreo               | 2017-10-01    | -'
    e_ac '5650811            | android-8.0.0_r37      | Oreo               | 2017-10-01    | -'
    e_ac 'OPR5.170623.014    | android-8.0.0_r36      | Oreo               | 2017-12-01    | Nexus 6P'
    e_ac 'OPR4.170623.020    | android-8.0.0_r35      | Oreo               | 2017-12-01    | Nexus 5X'
    e_ac 'OPD3.170816.023    | android-8.0.0_r34      | Oreo               | 2017-11-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPD1.170816.025    | android-8.0.0_r33      | Oreo               | 2017-11-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPR6.170623.023    | android-8.0.0_r32      | Oreo               | 2017-11-05    | Nexus 5X'
    e_ac 'OPR5.170623.011    | android-8.0.0_r31      | Oreo               | 2017-11-05    | Nexus 6P'
    e_ac 'OPR3.170623.013    | android-8.0.0_r30      | Oreo               | 2017-11-05    | Pixel XL, Pixel'
    e_ac 'OPR2.170623.027    | android-8.0.0_r29      | Oreo               | 2017-11-05    | Nexus Player'
    e_ac 'OPR1.170623.032    | android-8.0.0_r28      | Oreo               | 2017-11-05    | Pixel XL, Pixel, Pixel C'
    e_ac 'OPD3.170816.016    | android-8.0.0_r27      | Oreo               | 2017-11-05    | Pixel 2'
    e_ac 'OPD2.170816.015    | android-8.0.0_r26      | Oreo               | 2017-11-05    | Pixel 2'
    e_ac 'OPD1.170816.018    | android-8.0.0_r25      | Oreo               | 2017-11-05    | Pixel 2'
    e_ac 'OPD3.170816.012    | android-8.0.0_r24      | Oreo               | 2017-09-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPD1.170816.012    | android-8.0.0_r23      | Oreo               | 2017-09-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPD1.170816.011    | android-8.0.0_r22      | Oreo               | 2017-09-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPD1.170816.010    | android-8.0.0_r21      | Oreo               | 2017-09-05    | Pixel 2 XL, Pixel 2'
    e_ac 'OPR5.170623.007    | android-8.0.0_r17      | Oreo               | 2017-10-05    | Nexus 6P'
    e_ac 'OPR4.170623.009    | android-8.0.0_r16      | Oreo               | 2017-10-05    | Nexus 5X'
    e_ac 'OPR3.170623.008    | android-8.0.0_r15      | Oreo               | 2017-10-05    | Pixel XL, Pixel'
    e_ac 'OPR1.170623.027    | android-8.0.0_r13      | Oreo               | 2017-10-05    | Pixel XL, Pixel, Pixel C'
    e_ac 'OPR6.170623.021    | android-8.0.0_r12      | Oreo               | 2017-09-05    | Nexus Player'
    e_ac 'OPR6.170623.019    | android-8.0.0_r11      | Oreo               | 2017-09-05    | Nexus 6P'
    e_ac 'OPR4.170623.006    | android-8.0.0_r10      | Oreo               | 2017-09-05    | Nexus 5X'
    e_ac 'OPR3.170623.007    | android-8.0.0_r9       | Oreo               | 2017-09-05    | Pixel XL, Pixel'
    e_ac 'OPR1.170623.026    | android-8.0.0_r7       | Oreo               | 2017-09-05    | Pixel XL, Pixel, Pixel C'
    e_ac 'OPR6.170623.013    | android-8.0.0_r4       | Oreo               | 2017-08-05    | Nexus 5X, Nexus 6P'
    e_ac 'OPR6.170623.012    | android-8.0.0_r3       | Oreo               | 2017-08-05    | Pixel XL, Pixel'
    e_ac 'OPR6.170623.011    | android-8.0.0_r2       | Oreo               | 2017-08-05    | Pixel XL, Pixel'
    e_ac 'OPR6.170623.010    | android-8.0.0_r1       | Oreo               | 2017-08-05    | Pixel C'
    e_ac '5787804            | android-7.1.2_r39      | Nougat             | 2017-10-01    | -'
    e_ac '5725750            | android-7.1.2_r38      | Nougat             | 2017-10-01    | -'
    e_ac '5650810            | android-7.1.2_r37      | Nougat             | 2017-10-01    | -'
    e_ac 'N2G48H             | android-7.1.2_r36      | Nougat             | 2017-10-05    | -'
    e_ac 'NZH54D             | android-7.1.2_r33      | Nougat             | 2017-08-05    | Pixel XL, Pixel'
    e_ac 'NKG47S             | android-7.1.2_r32      | Nougat             | 2017-08-05    | Pixel XL, Pixel'
    e_ac 'NHG47Q             | android-7.1.2_r30      | Nougat             | 2017-08-05    | Pixel XL, Pixel'
    e_ac 'NJH47F             | android-7.1.2_r29      | Nougat             | 2017-08-05    | Pixel XL, Pixel'
    e_ac 'N2G48C             | android-7.1.2_r28      | Nougat             | 2017-08-05    | Nexus 5X, Nexus 6P, Nexus Player, Pixel C'
    e_ac 'NZH54B             | android-7.1.2_r27      | Nougat             | 2017-07-05    | Pixel XL, Pixel'
    e_ac 'NKG47M             | android-7.1.2_r25      | Nougat             | 2017-07-05    | Pixel XL, Pixel'
    e_ac 'NJH47D             | android-7.1.2_r24      | Nougat             | 2017-07-05    | Pixel XL, Pixel'
    e_ac 'NHG47O             | android-7.1.2_r23      | Nougat             | 2017-07-05    | Pixel XL, Pixel'
    e_ac 'N2G48B             | android-7.1.2_r19      | Nougat             | 2017-07-05    | Nexus 6P, Nexus Player, Pixel C'
    e_ac 'N2G47Z             | android-7.1.2_r18      | Nougat             | 2017-07-05    | Nexus 5X'
    e_ac 'NJH47B             | android-7.1.2_r17      | Nougat             | 2017-06-05    | Pixel XL, Pixel'
    e_ac 'NJH34C             | android-7.1.2_r16      | Nougat             | 2017-06-05    | Pixel XL, Pixel'
    e_ac 'NKG47L             | android-7.1.2_r15      | Nougat             | 2017-06-05    | Pixel XL, Pixel'
    e_ac 'NHG47N             | android-7.1.2_r14      | Nougat             | 2017-06-05    | Pixel XL, Pixel'
    e_ac 'N2G47X             | android-7.1.2_r13      | Nougat             | 2017-06-05    | Nexus Player'
    e_ac 'N2G47W             | android-7.1.2_r12      | Nougat             | 2017-06-05    | Nexus 5X, Nexus 6P, Pixel C'
    e_ac 'NHG47L             | android-7.1.2_r11      | Nougat             | 2017-05-05    | Pixel XL, Pixel'
    e_ac 'N2G47T             | android-7.1.2_r10      | Nougat             | 2017-05-05    | Pixel XL, Pixel'
    e_ac 'N2G47R             | android-7.1.2_r9       | Nougat             | 2017-05-05    | Nexus Player'
    e_ac 'N2G47O             | android-7.1.2_r8       | Nougat             | 2017-05-05    | Nexus 5X, Nexus 6P, Pixel XL, Pixel, Pixel C'
    e_ac 'NHG47K             | android-7.1.2_r6       | Nougat             | 2017-04-05    | Pixel XL, Pixel'
    e_ac 'N2G47J             | android-7.1.2_r5       | Nougat             | 2017-04-05    | Pixel XL, Pixel'
    e_ac 'N2G47H             | android-7.1.2_r4       | Nougat             | 2017-04-05    | Nexus 6P, Nexus Player'
    e_ac 'N2G47F             | android-7.1.2_r3       | Nougat             | 2017-04-05    | Nexus 5X'
    e_ac 'N2G47E             | android-7.1.2_r2       | Nougat             | 2017-04-05    | Pixel XL, Pixel'
    e_ac 'N2G47D             | android-7.1.2_r1       | Nougat             | 2017-04-05    | Pixel C'
    e_ac '5787798            | android-7.1.1_r61      | Nougat             | 2017-10-01    | -'
    e_ac '5725749            | android-7.1.1_r60      | Nougat             | 2017-10-01    | -'
    e_ac '5650809            | android-7.1.1_r59      | Nougat             | 2017-10-01    | -'
    e_ac 'N9F27M             | android-7.1.1_r58      | Nougat             | 2017-10-05    | Nexus 9 (volantis)'
    e_ac 'NGI77B             | android-7.1.1_r57      | Nougat             | 2017-10-05    | Nexus 6'
    e_ac 'N8I11F             | android-7.1.1_r56      | Nougat             | 2017-10-05    | Nexus 6'
    e_ac 'N6F27M             | android-7.1.1_r55      | Nougat             | 2017-10-05    | Nexus 6'
    e_ac 'N4F27P             | android-7.1.1_r54      | Nougat             | 2017-10-05    | Nexus 9 (volantisg)'
    e_ac 'N9F27L             | android-7.1.1_r53      | Nougat             | 2017-09-05    | Nexus 9'
    e_ac 'NGI55D             | android-7.1.1_r52      | Nougat             | 2017-09-05    | Nexus 6'
    e_ac 'N4F27O             | android-7.1.1_r51      | Nougat             | 2017-09-05    | Nexus 9 (volantisg)'
    e_ac 'N8I11B             | android-7.1.1_r50      | Nougat             | 2017-08-05    | Nexus 6'
    e_ac 'N9F27H             | android-7.1.1_r49      | Nougat             | 2017-08-05    | Nexus 9 (volantis)'
    e_ac 'N6F27I             | android-7.1.1_r48      | Nougat             | 2017-08-05    | Nexus 6'
    e_ac 'N4F27K             | android-7.1.1_r47      | Nougat             | 2017-08-05    | Nexus 9 (volantisg)'
    e_ac 'N9F27F             | android-7.1.1_r46      | Nougat             | 2017-07-05    | Nexus 9 (volantis)'
    e_ac 'N6F27H             | android-7.1.1_r45      | Nougat             | 2017-07-05    | Nexus 6'
    e_ac 'N4F27I             | android-7.1.1_r44      | Nougat             | 2017-07-05    | Nexus 9 (volantisg)'
    e_ac 'N9F27C             | android-7.1.1_r43      | Nougat             | 2017-06-05    | Nexus 9 (volantis)'
    e_ac 'N6F27E             | android-7.1.1_r42      | Nougat             | 2017-06-05    | Nexus 6'
    e_ac 'N4F27E             | android-7.1.1_r41      | Nougat             | 2017-06-05    | Nexus 9 (volantisg)'
    e_ac 'N6F27C             | android-7.1.1_r40      | Nougat             | 2017-05-05    | Nexus 6'
    e_ac 'N4F27B             | android-7.1.1_r39      | Nougat             | 2017-05-05    | Nexus 9 (volantis/volantisg)'
    e_ac 'N6F26Y             | android-7.1.1_r38      | Nougat             | 2017-04-01    | Nexus 6'
    e_ac 'NOF27D             | android-7.1.1_r35      | Nougat             | 2017-04-01    | Pixel XL, Pixel'
    e_ac 'N4F26X             | android-7.1.1_r33      | Nougat             | 2017-04-01    | Nexus 9 (volantis/volantisg)'
    e_ac 'N4F26U             | android-7.1.1_r31      | Nougat             | 2017-04-01    | Nexus 5X, Nexus 6P'
    e_ac 'N6F26U             | android-7.1.1_r28      | Nougat             | 2017-03-05    | Nexus 6'
    e_ac 'NUF26N             | android-7.1.1_r27      | Nougat             | 2017-03-05    | Nexus 6P'
    e_ac 'NOF27C             | android-7.1.1_r26      | Nougat             | 2017-03-05    | Pixel XL, Pixel'
    e_ac 'NOF27B             | android-7.1.1_r25      | Nougat             | 2017-03-05    | Pixel XL, Pixel'
    e_ac 'N4F26T             | android-7.1.1_r24      | Nougat             | 2017-03-05    | Nexus 5X, Nexus 6P, Nexus 9 (volantis/volantisg), Pixel C'
    e_ac 'NMF27D             | android-7.1.1_r23      | Nougat             | 2017-03-05    | Nexus Player'
    e_ac 'NMF26X             | android-7.1.1_r22      | Nougat             | 2017-02-05    | Nexus Player'
    e_ac 'NOF26W             | android-7.1.1_r21      | Nougat             | 2017-02-05    | Pixel XL, Pixel'
    e_ac 'NOF26V             | android-7.1.1_r20      | Nougat             | 2017-02-05    | Pixel XL, Pixel'
    e_ac 'N6F26R             | android-7.1.1_r17      | Nougat             | 2017-02-05    | Nexus 6'
    e_ac 'NUF26K             | android-7.1.1_r16      | Nougat             | 2017-02-05    | Nexus 6P'
    e_ac 'N4F26Q             | android-7.1.1_r15      | Nougat             | 2017-02-05    | Nexus 9 (volantis/volantisg)'
    e_ac 'N4F26O             | android-7.1.1_r14      | Nougat             | 2017-02-05    | Nexus 5X, Nexus 6P, Pixel C'
    e_ac 'N6F26Q             | android-7.1.1_r13      | Nougat             | 2017-01-05    | Nexus 6'
    e_ac 'N4F26M             | android-7.1.1_r12      | Nougat             | 2017-01-01    | Nexus 9 (volantis)'
    e_ac 'N4F26J             | android-7.1.1_r11      | Nougat             | 2017-01-05    | Nexus 5X, Nexus 6P'
    e_ac 'N4F26I             | android-7.1.1_r10      | Nougat             | 2017-01-05    | Nexus 5X, Nexus 6P, Pixel C'
    e_ac 'NMF26V             | android-7.1.1_r9       | Nougat             | 2017-01-05    | Pixel XL, Pixel'
    e_ac 'NMF26U             | android-7.1.1_r8       | Nougat             | 2017-01-05    | Pixel XL, Pixel'
    e_ac 'NMF26R             | android-7.1.1_r7       | Nougat             | 2017-01-05    | Nexus Player'
    e_ac 'NMF26Q             | android-7.1.1_r6       | Nougat             | 2016-12-05    | Pixel XL, Pixel'
    e_ac 'NMF26O             | android-7.1.1_r4       | Nougat             | 2016-12-05    | Pixel XL, Pixel'
    e_ac 'NMF26J             | android-7.1.1_r3       | Nougat             | 2016-12-05    | Nexus Player'
    e_ac 'NMF26H             | android-7.1.1_r2       | Nougat             | 2016-12-05    | Pixel C'
    e_ac 'NMF26F             | android-7.1.1_r1       | Nougat             | 2016-12-05    | Nexus 5X, Nexus 6P, Nexus 9 (volantis/volantisg)'
    e_ac 'NDE63X             | android-7.1.0_r7       | Nougat             | 2016-11-05    | Pixel XL, Pixel'
    e_ac 'NDE63V             | android-7.1.0_r6       | Nougat             | 2016-11-05    | Pixel XL, Pixel'
    e_ac 'NDE63U             | android-7.1.0_r5       | Nougat             | 2016-11-05    | Pixel XL, Pixel'
    e_ac 'NDE63P             | android-7.1.0_r4       | Nougat             | 2016-10-05    | Pixel XL, Pixel'
    e_ac 'NDE63L             | android-7.1.0_r2       | Nougat             | 2016-10-05    | Pixel XL, Pixel'
    e_ac 'NDE63H             | android-7.1.0_r1       | Nougat             | 2016-10-05    | Pixel XL, Pixel'
    e_ac 'NBD92Y             | android-7.0.0_r36      | Nougat             | 2019-03-01    | -'
    e_ac 'NBD92Q             | android-7.0.0_r35      | Nougat             | 2017-11-01    | -'
    e_ac 'NBD92N             | android-7.0.0_r34      | Nougat             | 2017-10-01    | -'
    e_ac 'NBD92G             | android-7.0.0_r33      | Nougat             | 2017-04-01    | Nexus 6'
    e_ac 'NBD92F             | android-7.0.0_r32      | Nougat             | 2017-04-01    | Nexus 6'
    e_ac 'NBD92E             | android-7.0.0_r31      | Nougat             | 2017-03-05    | Nexus 6'
    e_ac 'NBD92D             | android-7.0.0_r30      | Nougat             | 2017-03-05    | Nexus 6'
    e_ac 'NBD91Z             | android-7.0.0_r29      | Nougat             | 2017-02-05    | Nexus 6'
    e_ac 'NBD91Y             | android-7.0.0_r28      | Nougat             | 2017-02-05    | Nexus 6'
    e_ac 'NBD91X             | android-7.0.0_r27      | Nougat             | 2017-01-05    | Nexus 6'
    e_ac 'NBD91U             | android-7.0.0_r24      | Nougat             | 2016-12-05    | Nexus 6'
    e_ac 'N5D91L             | android-7.0.0_r21      | Nougat             | 2016-11-05    | Nexus 5X'
    e_ac 'NBD91P             | android-7.0.0_r19      | Nougat             | 2016-11-05    | Nexus 6'
    e_ac 'NRD91K             | android-7.0.0_r17      | Nougat             | 2016-11-05    | Nexus 6P'
    e_ac 'NRD91N             | android-7.0.0_r15      | Nougat             | 2016-11-05    | Nexus 5X, Pixel C, Nexus Player, Nexus 9 (volantis/volantisg)'
    e_ac 'NBD90Z             | android-7.0.0_r14      | Nougat             | 2016-10-05    | Nexus 6'
    e_ac 'NBD90X             | android-7.0.0_r13      | Nougat             | 2016-10-05    | Nexus 6P'
    e_ac 'NBD90W             | android-7.0.0_r12      | Nougat             | 2016-10-05    | Nexus 5X'
    e_ac 'NRD91D             | android-7.0.0_r7       | Nougat             | 2016-10-05    | Pixel C, Nexus Player, Nexus 9 (Wi-Fi)'
    e_ac 'NRD90U             | android-7.0.0_r6       | Nougat             | 2016-09-06    | Nexus 6P'
    e_ac 'NRD90T             | android-7.0.0_r5       | Nougat             | 2016-09-06    | Nexus 6P'
    e_ac 'NRD90S             | android-7.0.0_r4       | Nougat             | 2016-09-06    | Nexus 5X'
    e_ac 'NRD90R             | android-7.0.0_r3       | Nougat             | 2016-09-06    | Nexus 5X, Nexus 9 (volantis), Nexus Player, Pixel C'
    e_ac 'NRD90M             | android-7.0.0_r1       | Nougat             | 2016-08-05    | Nexus 5X, Nexus 9 (volantis), Nexus Player, Pixel C'
    e_ac 'MOI10E             | android-6.0.1_r81      | Marshmallow        | 2017-10-01    | -'
    e_ac 'MOB31Z             | android-6.0.1_r80      | Marshmallow        | 2017-07-01    | -'
    e_ac 'MOB31T             | android-6.0.1_r79      | Marshmallow        | 2017-02-01    | Nexus 6'
    e_ac 'MOB31S             | android-6.0.1_r78      | Marshmallow        | 2017-01-05    | Nexus 6'
    e_ac 'M4B30Z             | android-6.0.1_r77      | Marshmallow        | 2016-10-05    | Nexus 5'
    e_ac 'MOB31K             | android-6.0.1_r74      | Marshmallow        | 2016-11-05    | Nexus 6'
    e_ac 'MMB31C             | android-6.0.1_r73      | Marshmallow        | 2016-11-05    | Nexus 6'
    e_ac 'M4B30X             | android-6.0.1_r72      | Marshmallow        | 2016-10-05    | Nexus 5'
    e_ac 'MOB31H             | android-6.0.1_r70      | Marshmallow        | 2016-10-05    | Nexus 6'
    e_ac 'MMB30Y             | android-6.0.1_r69      | Marshmallow        | 2016-10-05    | Nexus 6'
    e_ac 'MTC20K             | android-6.0.1_r67      | Marshmallow        | 2016-09-06    | Nexus 5X'
    e_ac 'MOB31E             | android-6.0.1_r66      | Marshmallow        | 2016-09-06    | Nexus 5, Nexus 6, Nexus 9 (volantis)'
    e_ac 'MMB30W             | android-6.0.1_r65      | Marshmallow        | 2016-09-06    | Nexus 6'
    e_ac 'MXC89L             | android-6.0.1_r63      | Marshmallow        | 2016-08-05    | Pixel C'
    e_ac 'MTC20F             | android-6.0.1_r62      | Marshmallow        | 2016-08-05    | Nexus 5X, Nexus 6P'
    e_ac 'MOB30Y             | android-6.0.1_r60      | Marshmallow        | 2016-08-05    | Nexus 5'
    e_ac 'MOB30X             | android-6.0.1_r59      | Marshmallow        | 2016-08-05    | Nexus 7 (flo/deb)'
    e_ac 'MOB30W             | android-6.0.1_r58      | Marshmallow        | 2016-08-05    | Nexus 6, Nexus 9 (volantis/volantisg), Nexus Player'
    e_ac 'MMB30S             | android-6.0.1_r57      | Marshmallow        | 2016-08-05    | Nexus 7 (deb)'
    e_ac 'MMB30R             | android-6.0.1_r56      | Marshmallow        | 2016-08-05    | Nexus 6'
    e_ac 'MXC89K             | android-6.0.1_r55      | Marshmallow        | 2016-07-05    | Pixel C'
    e_ac 'MTC19Z             | android-6.0.1_r54      | Marshmallow        | 2016-07-05    | Nexus 5X'
    e_ac 'MTC19X             | android-6.0.1_r53      | Marshmallow        | 2016-07-05    | Nexus 6P'
    e_ac 'MOB30P             | android-6.0.1_r50      | Marshmallow        | 2016-07-05    | Nexus 5, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player'
    e_ac 'MOB30O             | android-6.0.1_r49      | Marshmallow        | 2016-07-05    | Nexus 6'
    e_ac 'MMB30M             | android-6.0.1_r48      | Marshmallow        | 2016-07-05    | Nexus 7 (deb)'
    e_ac 'MMB30K             | android-6.0.1_r47      | Marshmallow        | 2016-07-05    | Nexus 6'
    e_ac 'MOB30M             | android-6.0.1_r46      | Marshmallow        | 2016-06-01    | Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player'
    e_ac 'MTC19V             | android-6.0.1_r45      | Marshmallow        | 2016-06-01    | Nexus 5X, Nexus 6P'
    e_ac 'MOB30J             | android-6.0.1_r43      | Marshmallow        | 2016-05-01    | Nexus 7 (flo/deb)'
    e_ac 'MOB30I             | android-6.0.1_r42      | Marshmallow        | 2016-05-01    | Nexus 6'
    e_ac 'MOB30H             | android-6.0.1_r41      | Marshmallow        | 2016-05-01    | Nexus 5'
    e_ac 'MOB30G             | android-6.0.1_r40      | Marshmallow        | 2016-05-01    | Nexus 9 (volantis/volantisg), Nexus Player'
    e_ac 'MXC89H             | android-6.0.1_r33      | Marshmallow        | 2016-06-01    | Pixel C'
    e_ac 'MXC89F             | android-6.0.1_r32      | Marshmallow        | 2016-05-01    | Pixel C'
    e_ac 'MMB30J             | android-6.0.1_r28      | Marshmallow        | 2016-06-01    | Nexus 6, Nexus 7 (deb)'
    e_ac 'MTC19T             | android-6.0.1_r25      | Marshmallow        | 2016-05-01    | Nexus 5X, Nexus 6P'
    e_ac 'M5C14J             | android-6.0.1_r31      | Marshmallow        | 2016-04-01    | Pixel C'
    e_ac 'MOB30D             | android-6.0.1_r30      | Marshmallow        | 2016-04-02    | Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player'
    e_ac 'MHC19Q             | android-6.0.1_r24      | Marshmallow        | 2016-04-02    | Nexus 5X, Nexus 6P'
    e_ac 'MHC19J             | android-6.0.1_r22      | Marshmallow        | 2016-03-01    | Nexus 5X'
    e_ac 'MHC19I             | android-6.0.1_r21      | Marshmallow        | 2016-03-01    | Nexus 6P'
    e_ac 'MMB29X             | android-6.0.1_r20      | Marshmallow        | 2016-04-02    | Nexus 5, Nexus 6, Nexus 7 (deb), Nexus 9 (volantisg)'
    e_ac 'MXC14G             | android-6.0.1_r18      | Marshmallow        | 2016-03-01    | Pixel C'
    e_ac 'MMB29V             | android-6.0.1_r17      | Marshmallow        | 2016-03-01    | Nexus 5, Nexus 5X, Nexus 6, Nexus 6P, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg)'
    e_ac 'MXB48T             | android-6.0.1_r16      | Marshmallow        | 2016-02-01    | Pixel C'
    e_ac 'MMB29U             | android-6.0.1_r13      | Marshmallow        | 2016-02-01    | Nexus Player'
    e_ac 'MMB29R             | android-6.0.1_r12      | Marshmallow        | 2016-02-01    | Nexus 9 (volantis/volantisg)'
    e_ac 'MMB29Q             | android-6.0.1_r11      | Marshmallow        | 2016-02-01    | Nexus 5, Nexus 5X, Nexus 6, Nexus 6P, Nexus 7 (flo/deb)'
    e_ac 'MMB29T             | android-6.0.1_r10      | Marshmallow        | 2016-01-01    | Nexus Player'
    e_ac 'MMB29S             | android-6.0.1_r9       | Marshmallow        | 2016-01-01    | Nexus 5, Nexus 6, Nexus 9 (volantis/volantisg)'
    e_ac 'MMB29P             | android-6.0.1_r8       | Marshmallow        | 2016-01-01    | Nexus 5X, Nexus 6P'
    e_ac 'MMB29O             | android-6.0.1_r7       | Marshmallow        | 2016-01-01    | Nexus 7 (flo/deb)'
    e_ac 'MXB48K             | android-6.0.1_r5       | Marshmallow        | 2015-12-01    | Pixel C'
    e_ac 'MXB48J             | android-6.0.1_r4       | Marshmallow        | 2015-12-01    | Pixel C'
    e_ac 'MMB29M             | android-6.0.1_r3       | Marshmallow        | 2015-12-01    | Nexus 6P, Nexus Player'
    e_ac 'MMB29K             | android-6.0.1_r1       | Marshmallow        | 2015-12-01    | Nexus 5, Nexus 5X, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg)'
    e_ac 'MMB29N             | android-6.0.0_r41      | Marshmallow        | 2015-11-01    | Nexus 6P'
    e_ac 'MDB08M             | android-6.0.0_r26      | Marshmallow        | 2015-11-01    | Nexus 5X, Nexus 6P'
    e_ac 'MDB08L             | android-6.0.0_r25      | Marshmallow        | 2015-11-01    | Nexus 5X, Nexus 6P'
    e_ac 'MDB08K             | android-6.0.0_r24      | Marshmallow        | 2015-10-01    | Nexus 6P'
    e_ac 'MDB08I             | android-6.0.0_r23      | Marshmallow        | 2015-10-01    | Nexus 5X'
    e_ac 'MDA89E             | android-6.0.0_r12      | Marshmallow        | 2015-10-01    | Nexus 5X'
    e_ac 'MDA89D             | android-6.0.0_r11      | Marshmallow        | 2015-10-01    | Nexus 6P'
    e_ac 'MRA59B             | android-6.0.0_r7       | Marshmallow        | 2015-12-01    | Nexus 7 (deb)'
    e_ac 'MRA58X             | android-6.0.0_r6       | Marshmallow        | 2015-11-01    | Nexus 6'
    e_ac 'MRA58V             | android-6.0.0_r5       | Marshmallow        | 2015-11-01    | Nexus 7 (flo/deb)'
    e_ac 'MRA58U             | android-6.0.0_r4       | Marshmallow        | 2015-10-01    | Nexus 7 (flo)'
    e_ac 'MRA58N             | android-6.0.0_r2       | Marshmallow        | 2015-11-01    | Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player'
    e_ac 'MRA58K             | android-6.0.0_r1       | Marshmallow        | 2015-10-01    | Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player'
    e_ac 'LMY49M             | android-5.1.1_r38      | Lollipop           | 2016-07-05    | Nexus 10'
    e_ac 'LMY49J             | android-5.1.1_r37      | Lollipop           | 2016-04-01    | Nexus 10'
    e_ac 'LMY49I             | android-5.1.1_r36      | Lollipop           | 2016-03-01    | Nexus 10'
    e_ac 'LMY49H             | android-5.1.1_r35      | Lollipop           | 2016-03-01    | Nexus 10'
    e_ac 'LMY49G             | android-5.1.1_r34      | Lollipop           | 2016-02-01    | Nexus 10'
    e_ac 'LMY49F             | android-5.1.1_r33      | Lollipop           | 2016-01-01    | Nexus 9 (volantisg), Nexus 10'
    e_ac 'LMY48Z             | android-5.1.1_r30      | Lollipop           | 2015-12-01    | Nexus 6, Nexus 7 (deb), Nexus 9 (volantisg), Nexus 10'
    e_ac 'LYZ28N             | android-5.1.1_r28      | Lollipop           | 2015-11-01    | Nexus 6 (for T-Mobile ONLY)'
    e_ac 'LMY48Y             | android-5.1.1_r26      | Lollipop           | 2015-11-01    | Nexus 6'
    e_ac 'LMY48X             | android-5.1.1_r25      | Lollipop           | 2015-11-01    | Nexus 6, Nexus 7 (deb), Nexus 9 (volantisg), Nexus 10'
    e_ac 'LMY48W             | android-5.1.1_r24      | Lollipop           | -             | Nexus 6'
    e_ac 'LVY48H             | android-5.1.1_r23      | Lollipop           | -             | Nexus 6 (for Google Fi ONLY)'
    e_ac 'LYZ28M             | android-5.1.1_r22      | Lollipop           | -             | Nexus 6 (for T-Mobile ONLY)'
    e_ac 'LMY48U             | android-5.1.1_r20      | Lollipop           | -             | Nexus 7 (deb)'
    e_ac 'LMY48T             | android-5.1.1_r19      | Lollipop           | -             | Nexus 4, Nexus 6, Nexus 9 (volantis/volantisg), Nexus 10'
    e_ac 'LVY48F             | android-5.1.1_r18      | Lollipop           | -             | Nexus 6 (for Google Fi ONLY)'
    e_ac 'LYZ28K             | android-5.1.1_r17      | Lollipop           | -             | Nexus 6 (for T-Mobile ONLY)'
    e_ac 'LMY48P             | android-5.1.1_r16      | Lollipop           | -             | Nexus 7 (deb)'
    e_ac 'LMY48N             | android-5.1.1_r15      | Lollipop           | -             | Nexus Player'
    e_ac 'LMY48M             | android-5.1.1_r14      | Lollipop           | -             | Nexus 4, Nexus 5, Nexus 6, Nexus 7 (flo), Nexus 9 (volantis/volantisg), Nexus 10'
    e_ac 'LVY48E             | android-5.1.1_r13      | Lollipop           | -             | Nexus 6 (for Google Fi ONLY)'
    e_ac 'LYZ28J             | android-5.1.1_r12      | Lollipop           | -             | Nexus 6 (for T-Mobile ONLY)'
    e_ac 'LMY48J             | android-5.1.1_r10      | Lollipop           | -             | Nexus Player'
    e_ac 'LMY48I             | android-5.1.1_r9       | Lollipop           | -             | Nexus 4, Nexus 5, Nexus 6, Nexus 7 (flo), Nexus 9 (volantis/volantisg), Nexus 10'
    e_ac 'LVY48C             | android-5.1.1_r8       | Lollipop           | -             | Nexus 6 (for Google Fi ONLY)'
    e_ac 'LMY48G             | android-5.1.1_r6       | Lollipop           | -             | Nexus 7 (flo)'
    e_ac 'LYZ28E             | android-5.1.1_r5       | Lollipop           | -             | Nexus 6 (for T-Mobile ONLY)'
    e_ac 'LMY47Z             | android-5.1.1_r4       | Lollipop           | -             | Nexus 6 (all carriers except T-Mobile US)'
    e_ac 'LMY48B             | android-5.1.1_r3       | Lollipop           | -             | Nexus 5'
    e_ac 'LMY47X             | android-5.1.1_r2       | Lollipop           | -             | Nexus 9 (volantis)'
    e_ac 'LMY47V             | android-5.1.1_r1       | Lollipop           | -             | Nexus 7 (flo/grouper), Nexus 10, Nexus Player'
    e_ac 'LMY47O             | android-5.1.0_r5       | Lollipop           | -             | Nexus 4, Nexus 7 (flo/deb)'
    e_ac 'LMY47M             | android-5.1.0_r4       | Lollipop           | -             | Nexus 6 (for T-Mobile ONLY)'
    e_ac 'LMY47I             | android-5.1.0_r3       | Lollipop           | -             | Nexus 5, Nexus 6'
    e_ac 'LMY47E             | android-5.1.0_r2       | Lollipop           | -             | Nexus 6'
    e_ac 'LMY47D             | android-5.1.0_r1       | Lollipop           | -             | Nexus 5, Nexus 6, Nexus 7 (grouper/tilapia), Nexus 10, Nexus Player'
    e_ac 'LRX22L             | android-5.0.2_r3       | Lollipop           | -             | Nexus 9 (volantis/volantisg)'
    e_ac 'LRX22G             | android-5.0.2_r1       | Lollipop           | -             | Nexus 7 (flo/deb/grouper/tilapia), Nexus 10'
    e_ac 'LRX22C             | android-5.0.1_r1       | Lollipop           | -             | Nexus 4, Nexus 5, Nexus 6 (shamu), Nexus 7 (flo), Nexus 9 (volantis/volantisg), Nexus 10'
    e_ac 'LRX21V             | android-5.0.0_r7.0.1   | Lollipop           | -             | Nexus Player (fugu)'
    e_ac 'LRX21T             | android-5.0.0_r6.0.1   | Lollipop           | -             | Nexus 4'
    e_ac 'LRX21R             | android-5.0.0_r5.1.0.1 | Lollipop           | -             | Nexus 9 (volantis)'
    e_ac 'LRX21Q             | android-5.0.0_r5.0.1   | Lollipop           | -             | Nexus 9 (volantis)'
    e_ac 'LRX21P             | android-5.0.0_r4.0.1   | Lollipop           | -             | Nexus 7 (flo/grouper), Nexus 10'
    e_ac 'LRX21O             | android-5.0.0_r3.0.1   | Lollipop           | -             | Nexus 5 (hammerhead), Nexus 6 (shamu)'
    e_ac 'LRX21M             | android-5.0.0_r2.0.1   | Lollipop           | -             | Nexus Player (fugu)'
    e_ac 'LRX21L             | android-5.0.0_r1.0.1   | Lollipop           | -             | Nexus 9 (volantis)'
    e_ac 'KTU84Q             | android-4.4.4_r2       | KitKat             | -             | Nexus 5 (hammerhead) (for 2Degrees/NZ, Telstra/AUS and India ONLY)'
    e_ac 'KTU84P             | android-4.4.4_r1       | KitKat             | -             | Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
    e_ac 'KTU84M             | android-4.4.3_r1.1     | KitKat             | -             | Nexus 5 (hammerhead)'
    e_ac 'KTU84L             | android-4.4.3_r1       | KitKat             | -             | Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
    e_ac 'KVT49L             | android-4.4.2_r2       | KitKat             | -             | Nexus 7 (deb Verizon)'
    e_ac 'KOT49H             | android-4.4.2_r1       | KitKat             | -             | Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
    e_ac 'KOT49E             | android-4.4.1_r1       | KitKat             | -             | Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
    e_ac 'KRT16S             | android-4.4_r1.2       | KitKat             | -             | Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10'
    e_ac 'KRT16M             | android-4.4_r1         | KitKat             | -             | Nexus 5 (hammerhead)'
    e_ac 'JLS36I             | android-4.3.1_r1       | Jelly Bean         | -             | Nexus 7 (deb)'
    e_ac 'JLS36C             | android-4.3_r3         | Jelly Bean         | -             | Nexus 7 (deb)'
    e_ac 'JSS15R             | android-4.3_r2.3       | Jelly Bean         | -             | Nexus 7 (flo)'
    e_ac 'JSS15Q             | android-4.3_r2.2       | Jelly Bean         | -             | Nexus 7 (flo)'
    e_ac 'JSS15J             | android-4.3_r2.1       | Jelly Bean         | -             | Nexus 7 (flo/deb)'
    e_ac 'JSR78D             | android-4.3_r2         | Jelly Bean         | -             | Nexus 7 (deb)'
    e_ac 'JWR66Y             | android-4.3_r1.1       | Jelly Bean         | -             | Galaxy Nexus, Nexus 7 (grouper/tilapia), Nexus 4, Nexus 10'
    e_ac 'JWR66V             | android-4.3_r1         | Jelly Bean         | -             | Galaxy Nexus, Nexus 7 (grouper/tilapia), Nexus 4, Nexus 10'
    e_ac 'JWR66N             | android-4.3_r0.9.1     | Jelly Bean         | -             | Galaxy Nexus, Nexus 7 (grouper/tilapia/flo), Nexus 4, Nexus 10'
    e_ac 'JWR66L             | android-4.3_r0.9       | Jelly Bean         | -             | Nexus 7'
    e_ac 'JDQ39E             | android-4.2.2_r1.2     | Jelly Bean         | -             | Nexus 4'
    e_ac 'JDQ39B             | android-4.2.2_r1.1     | Jelly Bean         | -             | Nexus 7'
    e_ac 'JDQ39              | android-4.2.2_r1       | Jelly Bean         | -             | Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10'
    e_ac 'JOP40G             | android-4.2.1_r1.2     | Jelly Bean         | -             | Nexus 4'
    e_ac 'JOP40F             | android-4.2.1_r1.1     | Jelly Bean         | -             | Nexus 10'
    e_ac 'JOP40D             | android-4.2.1_r1       | Jelly Bean         | -             | Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10'
    e_ac 'JOP40C             | android-4.2_r1         | Jelly Bean         | -             | Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10'
    e_ac 'JZO54M             | android-4.1.2_r2.1     | Jelly Bean         | -             | -'
    e_ac 'JZO54L             | android-4.1.2_r2       | Jelly Bean         | -             | -'
    e_ac 'JZO54K             | android-4.1.2_r1       | Jelly Bean         | -             | Nexus S, Galaxy Nexus, Nexus 7'
    e_ac 'JRO03S             | android-4.1.1_r6.1     | Jelly Bean         | -             | Nexus 7'
    e_ac 'JRO03R             | android-4.1.1_r6       | Jelly Bean         | -             | Nexus S 4G'
    e_ac 'JRO03O             | android-4.1.1_r5       | Jelly Bean         | -             | Galaxy Nexus'
    e_ac 'JRO03L             | android-4.1.1_r4       | Jelly Bean         | -             | Nexus S'
    e_ac 'JRO03H             | android-4.1.1_r3       | Jelly Bean         | -             | -'
    e_ac 'JRO03E             | android-4.1.1_r2       | Jelly Bean         | -             | Nexus S'
    e_ac 'JRO03D             | android-4.1.1_r1.1     | Jelly Bean         | -             | Nexus 7'
    e_ac 'JRO03C             | android-4.1.1_r1       | Jelly Bean         | -             | Galaxy Nexus'
    e_ac 'IMM76L             | android-4.0.4_r2.1     | Ice Cream Sandwich | -             | -'
    e_ac 'IMM76K             | android-4.0.4_r2       | Ice Cream Sandwich | -             | Galaxy Nexus'
    e_ac 'IMM76I             | android-4.0.4_r1.2     | Ice Cream Sandwich | -             | Galaxy Nexus'
    e_ac 'IMM76D             | android-4.0.4_r1.1     | Ice Cream Sandwich | -             | Nexus S, Nexus S 4G, Galaxy Nexus'
    e_ac 'IMM76              | android-4.0.4_r1       | Ice Cream Sandwich | -             | -'
    e_ac 'IML77              | android-4.0.3_r1.1     | Ice Cream Sandwich | -             | -'
    e_ac 'IML74K             | android-4.0.3_r1       | Ice Cream Sandwich | -             | Nexus S'
    e_ac 'ICL53F             | android-4.0.2_r1       | Ice Cream Sandwich | -             | Galaxy Nexus'
    e_ac 'ITL41F             | android-4.0.1_r1.2     | Ice Cream Sandwich | -             | Galaxy Nexus'
    e_ac 'ITL41D             | android-4.0.1_r1.1     | Ice Cream Sandwich | -             | Galaxy Nexus'
    e_ac 'ITL41D             | android-4.0.1_r1       | Ice Cream Sandwich | -             | Galaxy Nexus'
    e_ac 'GWK74              | android-2.3.7_r1       | Gingerbread        | -             | Nexus S 4G'
    e_ac 'GRK39F             | android-2.3.6_r1       | Gingerbread        | -             | Nexus One, Nexus S'
    e_ac 'GRK39C             | android-2.3.6_r0.9     | Gingerbread        | -             | Nexus S'
    e_ac 'GRJ90              | android-2.3.5_r1       | Gingerbread        | -             | Nexus S 4G'
    e_ac 'GRJ22              | android-2.3.4_r1       | Gingerbread        | -             | Nexus One, Nexus S, Nexus S 4G'
    e_ac 'GRJ06D             | android-2.3.4_r0.9     | Gingerbread        | -             | Nexus S 4G'
    e_ac 'GRI54              | android-2.3.3_r1.1     | Gingerbread        | -             | Nexus S'
    e_ac 'GRI40              | android-2.3.3_r1       | Gingerbread        | -             | Nexus One, Nexus S'
    e_ac 'GRH78C             | android-2.3.2_r1       | Gingerbread        | -             | Nexus S'
    e_ac 'GRH78              | android-2.3.1_r1       | Gingerbread        | -             | Nexus S'
    e_ac 'GRH55              | android-2.3_r1         | Gingerbread        | -             | Earliest Gingerbread version, Nexus S'
    e_ac 'FRK76C             | android-2.2.3_r2       | Froyo              | -             | -'
    e_ac 'FRK76              | android-2.2.3_r1       | Froyo              | -             | -'
    e_ac 'FRG83G             | android-2.2.2_r1       | Froyo              | -             | Nexus One'
    e_ac 'FRG83D             | android-2.2.1_r2       | Froyo              | -             | Nexus One'
    e_ac 'FRG83              | android-2.2.1_r1       | Froyo              | -             | Nexus One'
    e_ac 'FRG22D             | android-2.2_r1.3       | Froyo              | -             | -'
    e_ac 'FRG01B             | android-2.2_r1.2       | Froyo              | -             | -'
    e_ac 'FRF91              | android-2.2_r1.1       | Froyo              | -             | Nexus One'
    e_ac 'FRF85B             | android-2.2_r1         | Froyo              | -             | Nexus One'
    e_ac 'EPF21B             | android-2.1_r2.1p2     | Eclair             | -             | -'
    e_ac 'ESE81              | android-2.1_r2.1s      | Eclair             | -             | -'
    e_ac 'EPE54B             | android-2.1_r2.1p      | Eclair             | -             | Nexus One'
    e_ac 'ERE27              | android-2.1_r2         | Eclair             | -             | Nexus One'
    e_ac 'ERD79              | android-2.1_r1         | Eclair             | -             | Nexus One'
    e_ac 'ESD56              | android-2.0.1_r1       | Eclair             | -             | -'
    e_ac 'ESD20              | android-2.0_r1         | Eclair             | -             | -'
    e_ac 'DMD64              | android-1.6_r1.5       | Donut              | -             | -'
    e_ac 'DRD20              | android-1.6_r1.4       | -                  | -             | -'
    e_ac 'DRD08              | android-1.6_r1.3       | -                  | -             | -'
    e_ac 'DRC92              | android-1.6_r1.2       | -                  | -             | -'
  ) | command grep --ignore-case -- "$1" | column -t -s'|'
}

#
# Function: _apk_xtract_values()
#
# Return an array with the relevant information of an .apk file
#
_apk_xtract_values () {
  apk_values=()

  # Regular Expressions patterns
  local pattern_app="application: label='(.*)' icon="
  local pattern_pkg="package: name='(.*)' versionCode='(.*)' versionName='([^']*)'"
  local pattern_sdk="sdkVersion:'(.*)'"
  local pattern_act="launchable-activity: name='([^']*)'"
  local apk_line tmp_var

  if [ ! -f "$1" ]; then
    e_em "No $1 file. Please provide a valid .apk file." '\n'
    return $E_FAILURE
  fi

  while read apk_line; do
    case "$apk_line" in
      'application: '* )
        if [[ $apk_line =~ $pattern_app ]]; then
          apk_values['application.label']=${BASH_REMATCH[1]}
        fi
        ;;

      'package: '* )
        if [[ $apk_line =~ $pattern_pkg ]]; then
          apk_values['package.name']=${BASH_REMATCH[1]}
          apk_values['version.name']=${BASH_REMATCH[3]}
          apk_values['version.code']=${BASH_REMATCH[2]}
        fi
        ;;

      'sdkVersion:'* )
        if [[ $apk_line =~ $pattern_sdk ]]; then
          apk_values['asdk.code']=${BASH_REMATCH[1]}
        fi
        ;;

      'launchable-activity:'* )
        if [[ $apk_line =~ $pattern_act ]]; then
          tmp_var=${apk_values['package.name']}
          apk_values['activity.component']=${tmp_var}'/'${BASH_REMATCH[1]##${tmp_var}}
        fi
        ;;
    esac
  done < <(aapt dump badging "$1" 2> /dev/null)

  return $E_SUCCESS
}

#
# Function: _apk_information()
#
# Display the relevant information from an .apk file
#
_apk_information () {
  local apk_file=$1

  _apk_xtract_values "$apk_file"
  [ $? -eq $E_FAILURE ] && return $E_FAILURE

  e_cm 'File Name    =' $apk_file
  e_ac 'Application  :' ${apk_values['application.label']}
  e_ac 'Package Name :' ${apk_values['package.name']}
  e_ac 'Version Name :' ${apk_values['version.name']}
  e_ac 'Version Code :' ${apk_values['version.code']}
  e_ac 'Android vOS  :' ${aapi_level[${apk_values['asdk.code']}]}
  e_ac 'Activity     :' ${apk_values['activity.component']:--} '\n'

  return $E_SUCCESS
}

#
# Function: _apk_rename_file()
#
# Rename a single .apk file
#
_apk_rename_file () {
  local apk_file=$1 template_match filename_prefix apk_filename filename_suffix xtra

  _apk_xtract_values "$apk_file"
  [ $? -eq $E_FAILURE ] && return $E_FAILURE

  # Look for the package name in the templates and obtain the prefix to use
  [ -f $DTOOLS_RC ] && IFS='=' read -r _ template_match < <(grep -m1 "^T \+${apk_values['package.name']} \+=" $DTOOLS_RC 2> /dev/null)

  # Trim the $template_match variable (by reference)
  trim_var_whitespace template_match

  # Reflect if a template was found
  if [ -n "$template_match" ]; then
    filename_prefix=$template_match
    xtra=" ${RED}[T]${R_COLOR}"
  else
    # Use the application name or the package name as the filename prefix
    [ -n "${apk_values['application.label']}" ] && filename_prefix=${apk_values['application.label']} || filename_prefix=${apk_values['package.name']}
    xtra=
  fi

  # Append the version name (if existent)
  [ -n "${apk_values['version.name']}" ] && filename_prefix=${filename_prefix}-${apk_values['version.name']}

  # Replace spaces with hyphens
  # TODO: Filter the rest of invalid characters in $filename_prefix
  filename_prefix=${filename_prefix// /-}

  # Lowercase the filename
  filename_prefix=${filename_prefix,,}

  # Conform the initial filename
  apk_filename=${filename_prefix}.apk
  filename_suffix=

  # "Nothing to Do" action return value
  local ACTION_NTD=2 action=

  # TODO
  # Here is an error in the logic of the unclashing process. The NTD
  # action must be determined before checking if the current file exists. If
  # there are 2 files (t.apk => x.apk) and (x.apk => z.apk) ... TBC

  # Determine the needed suffix to avoid clashing with already existent files
  while [ -f "$apk_filename" ]; do
    [ "$apk_file" = "$apk_filename" ] && action=$ACTION_NTD && break
    let filename_suffix--
    apk_filename=${filename_prefix}${filename_suffix}.apk
  done

  e_ac -n ${apk_file} "${WHITE}->${R_COLOR}" ${apk_filename}${xtra} "${WHITE}...${R_COLOR} "

  if [ "$action" != "$ACTION_NTD" ]; then
    mv "$apk_file" "$apk_filename" > /dev/null 2>&1
    action=$?
  fi

  # Output the result of the operation
  case "$action" in
    $ACTION_NTD ) e_hc "${I_GRAY}NTD${R_COLOR}" ;;
    $E_SUCCESS  ) e_hc "${I_YELLOW}D!${R_COLOR}" ;;
    $E_FAILURE  ) echo 'I/O Error' ;;
    *           ) echo 'Unknown Error' ;;
  esac

  return $E_SUCCESS
}

#
# Function: apk()
#
# Interface to ease the handling of Android Package files
#
apk () {
  # Process command line options
  case "$1" in
    --info | -i )
      local opt_action='info'
      local ehr_title='APK Information Tool'
      ;;

    --rename | -r )
      local opt_action='rename'
      local ehr_title='APK Rename Tool'
      ;;

    # Edit the Droid Tools RC file
    --edit | -e )
      $EDITOR $DTOOLS_RC
      return $?
      ;;

    --help | -h )
      _droid_tools_plugin_help $FUNCNAME
      return $E_SUCCESS
      ;;

    * )
      e_em "Unknown parameter in command line: $@\n       Try '$FUNCNAME --help' for more information."
      return $E_FAILURE
      ;;
  esac
  shift

  e_hr 'Android Tools Suite' $ehr_title '\n'

  local apk_file oifs=$IFS nifs=$'\n' IFS=$nifs
  for apk_file in ${@:-*.apk}; do
    IFS=$oifs
    case "$opt_action" in
      info   ) _apk_information "$apk_file" ;;
      rename ) _apk_rename_file "$apk_file" ;;
    esac
    IFS=$nifs
  done
  IFS=$oifs
}

#
# Function: afwi()
#
# Return the relevant information obtained from FW files
#
afwi () {
  # Process command line options
  case "$1" in
    --list | -l )
      local opt_list=1
      shift
      ;;

    --help | -h )
      _droid_tools_plugin_help $FUNCNAME
      return $E_SUCCESS
      ;;
  esac

  e_hr 'Android Tools Suite' 'Firmware Information Tool' '\n'

  local fw_file m_prop m_value e_md5 e_rfn n_md5 embedded_length rcode

  for fw_file in "$@"; do
    if [ ! -f "$fw_file" ]; then
      e_em "No $fw_file file. Please provide a valid Android Firmware file." '\n'
      continue
    fi

    e_cm 'AFW File Name      =' $fw_file

    case $fw_file in
      # Sony / Sony Ericsson FW file
      *.ftf )
        e_ac 'FW Manufacturer    : Sony / Sony Ericsson'
        e_ac 'FW Flashing Tool   : FlashTool'

        # Read Manifest interesting values
        IFS=': '
        while read m_prop m_value; do
          case "$m_prop" in
            device   ) e_ac 'Manifest Device    :' $m_value ;;
            branding ) e_ac 'Manifest Branding  :' $m_value ;;
            version  ) e_ac 'Manifest Version   :' $m_value ;;
          esac
        done < <(unzip -p "$fw_file" META-INF/MANIFEST.MF)

        echo
        [ -n "$opt_list" ] && unzip -v "$fw_file" | grep -F '%' | column -t | sed 's/^/  /' && echo
        ;;

      # Samsung FW file
      *.tar.md5 )
        # Workaround: Obtain the last 256 characters from the end of the file
        # and extract the MD5 and the original filename from that region.
        IFS='  ' read -r e_md5 e_rfn < <(tail -c256 $fw_file 2> /dev/null)

        # Lowercase embedded MD5 to avoid case mismatch (thanks to
        # S5310XXAMF1_S5310MSTAMF1_S5310XXAME1_HOME.tar.md5 :-)
        e_md5=${e_md5,,}

        e_ac 'FW Manufacturer    : Samsung'
        e_ac 'FW Flashing Tool   : Heimdall / Odin'

        [[ -z $e_rfn || -z $e_md5 ]] && echo -n '  ' && e_em 'Malformed or corrupt Samsung Firmware file' '\n' && continue

        e_ac 'Embedded File Name :' $e_rfn
        e_ac 'Embedded MD5 Check :' $e_md5

        # Calculate MD5 for validation purposes (unless asked for TAR content)
        if [ -z "$opt_list" ]; then
          echo -en "  ${I_GRAY}- Calculating MD5 Sum -${R_COLOR}"

          # Amount of content (in characters) to exclude from actual MD5 sum
          # equals to MD5 length + Filename length + 3 (2 spaces + \0A)
          let "embedded_length = ${#e_md5} + ${#e_rfn} + 3"
          read n_md5 _ < <(head --bytes=-$embedded_length $fw_file | md5sum)

          [ "$e_md5" = "$n_md5" ] && rcode="${I_YELLOW}OK!${R_COLOR}" || rcode="${RED}FAILED!${R_COLOR}"

          echo -en '\r'; e_ac 'Calculated MD5 Sum :' $n_md5 "-" $rcode '\n'
        else
          echo
          # Include the TAR file content (if option given)
          tar --list --verbose --file $fw_file | column -t | sed 's/^/  /' && echo
        fi
        ;;

      # Unknown FW file
      * )
        e_dm 'Unknown Android Firmware format'
        echo
        ;;
    esac
  done

  return $E_SUCCESS
}

#
# Function: dtools()
#
# Display the Help for the plugin and the related functions
#
dtools () {
  _droid_tools_plugin_help
}

# --------------------------------------------------------------------------------------------------
#  Base Functions
# --------------------------------------------------------------------------------------------------

#
# Function: _droid_tools_plugin_init()
#
# Setup the plugin required environment (Autoloading Function)
#
_droid_tools_plugin_init () {
  # Define the location of the Droid Tools RC file
  [ -z "$MXDF_ACTIVE" ] && DTOOLS_RC=$MXDF_BASH_LOCAL/droid-tools.rc

  # The array returning the values from the _apk_xtract_values() function
  declare -A -g apk_values

  # Android API information
  declare -a -g aapi_level
  aapi_level[ 1]='Base (No Code Name) | 1.0           | API  1'
  aapi_level[ 2]='Base (No Code Name) | 1.1           | API  2'
  aapi_level[ 3]='Cupcake             | 1.5           | API  3, NDK 1'
  aapi_level[ 4]='Donut               | 1.6           | API  4, NDK 2'
  aapi_level[ 5]='Eclair              | 2.0           | API  5'
  aapi_level[ 6]='Eclair              | 2.0.1         | API  6'
  aapi_level[ 7]='Eclair              | 2.1           | API  7, NDK 3'
  aapi_level[ 8]='Froyo               | 2.2.x         | API  8, NDK 4'
  aapi_level[ 9]='Gingerbread         | 2.3 - 2.3.2   | API  9, NDK 5'
  aapi_level[10]='Gingerbread         | 2.3.3 - 2.3.7 | API 10'
  aapi_level[11]='Honeycomb           | 3.0           | API 11'
  aapi_level[12]='Honeycomb           | 3.1           | API 12, NDK 6'
  aapi_level[13]='Honeycomb           | 3.2.x         | API 13'
  aapi_level[14]='Ice Cream Sandwich  | 4.0.1 - 4.0.2 | API 14, NDK 7'
  aapi_level[15]='Ice Cream Sandwich  | 4.0.3 - 4.0.4 | API 15, NDK 8'
  aapi_level[16]='Jelly Bean          | 4.1.x         | API 16'
  aapi_level[17]='Jelly Bean          | 4.2.x         | API 17'
  aapi_level[18]='Jelly Bean          | 4.3.x         | API 18'
  aapi_level[19]='KitKat              | 4.4 - 4.4.4   | API 19'
  aapi_level[21]='Lollipop            | 5.0           | API 21'
  aapi_level[22]='Lollipop            | 5.1           | API 22'
} &&
_droid_tools_plugin_init

#
# Function: _droid_tools_plugin_help()
#
# Display the Help for the plugin and the related functions
#
_droid_tools_plugin_help () {
  _mxdf_show_header $BASH_SOURCE

  case "$1" in
    apk ) cat <<__HEREDOC_APK_HELP
$1 is meant to ease the process of dealing with Android Packages files.

Usage:
  $1 [<option>] [<.apk1> <.apk2> ...]

  When no <option> is specified, same as --info (-i)
  When no <.apk> filename is specified, implies '*.apk' in the current directory

Options:
  -i, --info      print relevant information about the APK files
  -r, --rename    rename the APK files
  -e, --edit      edit the template file for the -r action
  -h, --help      print this help message and exit
__HEREDOC_APK_HELP
      ;;

    afwi ) cat <<__HEREDOC_AFWI_HELP
AFWI - TBW!
__HEREDOC_AFWI_HELP
      ;;

    * ) _describe_component_item $BASH_SOURCE
      ;;
  esac

  _mxdf_show_copyright
}

# --------------------------------------------------------------------------------------------------
#  Aliases Definitions
# --------------------------------------------------------------------------------------------------

alias @adb='adb shell'
alias fastboot='sudo fastboot'
alias fb='fastboot'

