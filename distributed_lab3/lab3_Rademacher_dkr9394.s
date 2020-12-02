@lab3_Rademacher_dkr9394.s
@david rademacher 1001469394

.global sortDecendingInPlace,sumF32,prodF64,dotpF64,maxF32,absSumF64,sqrtSumF64,getDirection,getAddNo,getCity

.text

@ void sortDecendingInPlace(int16_t x[], uint32_t count)
sortDecendingInPlace:
	BX LR

@ float sumF32(float x[], uint32_t count)
sumF32:
	BX LR

@ double prodF64(double x[], uint32_t count)
prodF64:
	BX LR

@ double dotpF64(double x[], double y[], uint32_t count)
dotpF64:
	BX LR

@ float maxF32(float x[], uint32_t count)
maxF32:
	BX LR

@ double absSumF64(double x[], uint32_t count)
absSumF64:
	BX LR

@ double sqrtSumF64(double x[], uint32_t count)
sqrtSumF64:
	BX LR

@ char getDirection(BUSINESS business[], uint32_t index)
getDirection:
	BX LR

@ uint32_t getAddNo(BUSINESS business[], uint32_t index)
getAddNo:
	BX LR

@ char * getCity(BUSINESS business[], uint32_t index)
getCity:
	BX LR


