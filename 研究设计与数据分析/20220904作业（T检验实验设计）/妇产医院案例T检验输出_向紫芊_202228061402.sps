* Encoding: UTF-8.
GET DATA
  /TYPE=XLS
  /FILE='D:\研究生-心理与行为大数据\研究设计与数据分析课程\2022年\心理统计教学案例\案例2 妇产医院差异性检验案例\妇产医院data.xls'
  /SHEET=name 'Sheet1'
  /CELLRANGE=FULL
  /READNAMES=ON
  /DATATYPEMIN PERCENTAGE=95.0.
EXECUTE.
DATASET NAME 数据集1 WINDOW=FRONT.

GET DATA
  /TYPE=XLS
  /FILE='D:\研究生-心理与行为大数据\研究设计与数据分析课程\2022年\心理统计教学案例\案例2 妇产医院差异性检验案例\妇产医院data.xls'
  /SHEET=name 'Sheet1'
  /CELLRANGE=FULL
  /READNAMES=ON
  /DATATYPEMIN PERCENTAGE=95.0.
EXECUTE.
DATASET NAME 数据集2 WINDOW=FRONT.
DATASET ACTIVATE 数据集2.
DATASET CLOSE 数据集1.

SAVE OUTFILE='D:\研究生-心理与行为大数据\研究设计与数据分析课程\2022年\心理统计教学案例\案例2 妇产医院差异性检验案例\妇产医院数据.sav'
  /COMPRESSED.
T-TEST GROUPS=Gender('Boy' 'Girl')
  /MISSING=ANALYSIS
  /VARIABLES=Babyweightinkg
  /CRITERIA=CI(.95).

EXAMINE VARIABLES=mother’seducationlevel Father’sEducationlevel
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

COMPUTE difference=Father’sEducationlevel-mother’seducationlevel.
EXECUTE.
EXAMINE VARIABLES=difference
  /PLOT BOXPLOT NPPLOT
  /COMPARE GROUPS
  /STATISTICS NONE
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

T-TEST PAIRS=mother’seducationlevel WITH Father’sEducationlevel (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=Agemotheryr WITH Agefatheryr (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

T-TEST PAIRS=Babyweightinkg WITH Agemotheryr (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

RECODE Prenatalsessionattendance ('Yes'=1) ('No'=0) INTO Prenatalssessionattendance_Z.
VARIABLE LABELS  Prenatalssessionattendance_Z '产前护理和教育'.
EXECUTE.
T-TEST PAIRS=Prenatalssessionattendance_Z WITH Overallsatisfaction (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.




