# PbVIAP
<img src="VIAP_logo.jpg" width=400 alt="Viap Logo" align="right">

Probalistic Program Verifier Integer Assignment Program(PbVIAP) translates a program to first-order logic with
quantifiers on natural numbers. 

### Awards & Achievements

Many more to come..

## Publications



# See below for system requirements, installation, usage, and everything else.

### Support

* If something is not working or missing, open an [issue](https://github.com/VerifierIntegerAssignment/VerifierIntegerAssignment.github.io/issues).

* As a last resort, send mail to 
  [Pritom Rajkhowa](mailto:pritom.rajkhowa@gmail.com), [Fangzhen Lin](mailto:flin@cs.ust.hk), or both.

* To stay informed about updates, you can either watch [VIAP](https://verifierintegerassignment.github.io/)'s Github page.




### System Requirements and Installation

In practice we have run PbVIAP on standard Ubuntu 18.04 LTS distribution. PbVIAP is provided as a set of binaries and libraries for
Ubuntu 18.04 LTS distribution. 

#### Download 


##### Clone over HTTPS:

 $ git clone https://github.com/pritomrajkhowa/PbVIAP
 
 #### Running PbVIAP


VIAP software verifier is run using the `pbviap_tool.py` tool in the viap directory.
For a given input C program, the tool checks for violations of user-provided
assertions. 

#### Running Command

PATH_TO_VIAP/pbviap_tool.py file

#### Output contains the string:
```
- set of axioms and json file
```



### variable1 represent output value (in paper output value is presented as  variable')


### Using The PbVIAP Tool

Next, we illustrate how to translate the following simple probalistic program using the PbVIAP
tool:

```C
// benchmarks/binomial.i
extern void __VERIFIER_error() __attribute__ ((__noreturn__));
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: __VERIFIER_error(); } }
int main( ) {
    int M;
    double n = 0;
    double x = 0;
    double y = 0;
    while(y<M){

         y = y + 1;

         @n = (n + 1) [1/2] n;

         @x = x + n [1/2] x;

   }

}
```

#### How to run above Example 

$pbviap/pbviap_tool.py  benchmarks/benchmark/binomial.i

#### Output 

```python
Program Body
{
  int M;
  double n;
  n = 0;
  double x;
  x = 0;
  double y;
  y = 0;
  while (y < M)
  {
    y = y + 1;
    n = W_(1 / 2, n + 1, n);
    x = W_(1 / 2, x + n, x);
  }

}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ y:double x:double M:int n:double}

Output in normal notation:
1. Frame axioms:
M1 = M

2. Output equations:
y1 = y3(_N1)
x1 = x3(_N1)
n1 = n3(_N1)

3. Other axioms:
y3((_n1+1)) = (y3(_n1)+1)
x3((_n1+1)) = W_((1/2),(x3(_n1)+W_((1/2),(n3(_n1)+1),n3(_n1))),x3(_n1))
n3((_n1+1)) = W_((1/2),(n3(_n1)+1),n3(_n1))
y3(0) = 0
x3(0) = 0
n3(0) = 0
(0<=(-(M)+y3(_N1)))
(_n1<_N1) -> (y3(_n1)<M)



II. Expected Values :



Output in normal notation:
1. Frame axioms:
E[M1] = M

2. Output equations:
E[y1] = y3(_N1)
E[x1] = x3(_N1)
E[n1] = n3(_N1)

3. Other axioms:
E[y3((_n1+1))] = (E[y3(_n1)] +E[1])
E[x3((_n1+1))] = ((1/2))*((E[(x3(_n1) +((1/2))*((E[(n3(_n1) +1)**k]))**_k+(1-(1/2))*(E[n3(_n1)])**_k)**k]))**_k+(1-(1/2))*(E[x3(_n1)])**_k
E[n3((_n1+1))] = ((1/2))*((E[(n3(_n1) +1)**k]))**_k+(1-(1/2))*(E[n3(_n1)])**_k
E[y3(0)] = 0
E[x3(0)] = 0
E[n3(0)] = 0
(E[0] <=(E[-(M)] +E[y3(_N1)]))
(_n1<_N1) -> (E[y3(_n1)] <E[M])



III. Higher Moment :



Output in normal notation:
1. Frame axioms:
E[(M1)**_h] = E[(M)**_k]

2. Output equations:
E[(y1)**_h] = E[(y3(_N1))**_k]
E[(x1)**_h] = E[(x3(_N1))**_k]
E[(n1)**_h] = E[(n3(_N1))**_k]

3. Other axioms:
E[(y3((_n1+1)))**_h] = (E[(y3(_n1) +1)**k])
E[(x3((_n1+1)))**_h] = E[(((1/2))*((E[(x3(_n1) +((1/2))*((E[(n3(_n1) +1)**k]))**_k+(1-(1/2))*(E[n3(_n1)])**_k)**k]))**_k+(1-(1/2))*(E[x3(_n1)])**_k)**_k]
E[(n3((_n1+1)))**_h] = E[(((1/2))*((E[(n3(_n1) +1)**k]))**_k+(1-(1/2))*(E[n3(_n1)])**_k)**_k]
E[(y3(0))**_h] = E[(0)**_k]
E[(x3(0))**_h] = E[(0)**_k]
E[(n3(0))**_h] = E[(0)**_k]
(E[(0)**_k] <=(E[(-(M) +y3(_N1))**k]))
(_n1<_N1) -> (E[((y3(_n1))**k <M**k)])
```



Next, we illustrate how to translate the following nested probalistic program using the PbVIAP
tool:

```C
// benchmarks/binomial.i
extern void __VERIFIER_error() __attribute__ ((__noreturn__));
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: __VERIFIER_error(); } }
int main( ) {
int M,L;
double x =0 , y = 0; 
int k = 0 ;
while(x<=L)
{   y = 0;
    while(y<=M){ y = y + uniform(-0.1,0.2); }
    x = x + uniform(-0.1,0.2); k = k+1;
}


}
```

#### How to run above Example 

$pbviap/pbviap_tool.py  benchmarks/benchmark/binomial.i

#### Output 

```python
Program Body
{
  int M;
  int L;
  double x;
  x = 0;
  double y;
  y = 0;
  int k;
  k = 0;
  while (x <= L)
  {
    y = 0;
    while (y <= M)
    {
      y = y + uniform(-0.100000000000000, 0.200000000000000);
    }

    x = x + uniform(-0.100000000000000, 0.200000000000000);
    k = k + 1;
  }

}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ y:double x:double k:int M:int L:int}

Output in normal notation:
1. Frame axioms:
M1 = M
L1 = L

2. Output equations:
y1 = y6(_N2)
x1 = x6(_N2)
k1 = k6(_N2)

3. Other axioms:
y2((_n1+1),_n2) = (y2(_n1,_n2)+RV(uniform,-(0.100000000000000),0.200000000000000))
y2(0,_n2) = 0
(y2(_N1(_n2),_n2)>M)
(_n1<_N1(_n2)) -> (y2(_n1,_n2)<=M)
y6((_n2+1)) = y2(_N1(_n2),_n2)
x6((_n2+1)) = (x6(_n2)+RV(uniform,-(0.100000000000000),0.200000000000000))
k6((_n2+1)) = (k6(_n2)+1)
y6(0) = 0
x6(0) = 0
k6(0) = 0
(x6(_N2)>L)
(_n2<_N2) -> (x6(_n2)<=L)



II. Expected Values :



Output in normal notation:
1. Frame axioms:
E[M1] = M
E[L1] = L

2. Output equations:
E[y1] = y6(_N2)
E[x1] = x6(_N2)
E[k1] = k6(_N2)

3. Other axioms:
E[y2((_n1+1),_n2)] = (E[y2(_n1,_n2)] +E[RV(uniform,-(0.100000000000000),0.200000000000000)])
E[y2(0,_n2)] = 0
(E[y2(_N1(_n2),_n2)] >E[M])
(_n1<_N1(_n2)) -> (E[y2(_n1,_n2)] <=E[M])
E[y6((_n2+1))] = y2(_N1(_n2),_n2)
E[x6((_n2+1))] = (E[x6(_n2)] +E[RV(uniform,-(0.100000000000000),0.200000000000000)])
E[k6((_n2+1))] = (E[k6(_n2)] +E[1])
E[y6(0)] = 0
E[x6(0)] = 0
E[k6(0)] = 0
(E[x6(_N2)] >E[L])
(_n2<_N2) -> (E[x6(_n2)] <=E[L])



III. Higher Moment :



Output in normal notation:
1. Frame axioms:
E[(M1)**_h] = E[(M)**_k]
E[(L1)**_h] = E[(L)**_k]

2. Output equations:
E[(y1)**_h] = E[(y6(_N2))**_k]
E[(x1)**_h] = E[(x6(_N2))**_k]
E[(k1)**_h] = E[(k6(_N2))**_k]

3. Other axioms:
E[(y2((_n1+1),_n2))**_h] = (E[(y2(_n1,_n2) +RV(uniform,-(0.100000000000000),0.200000000000000))**k])
E[(y2(0,_n2))**_h] = E[(0)**_k]
(E[(y2(_N1(_n2),_n2))**_k] >E[(M)**k])
(_n1<_N1(_n2)) -> (E[(y2(_n1,_n2))**_k] <=E[(M)**k])
E[(y6((_n2+1)))**_h] = E[(y2(_N1(_n2),_n2))**_k]
E[(x6((_n2+1)))**_h] = (E[(x6(_n2) +RV(uniform,-(0.100000000000000),0.200000000000000))**k])
E[(k6((_n2+1)))**_h] = (E[(k6(_n2) +1)**k])
E[(y6(0))**_h] = E[(0)**_k]
E[(x6(0))**_h] = E[(0)**_k]
E[(k6(0))**_h] = E[(0)**_k]
(E[(x6(_N2))**_k] >E[(L)**k])
(_n2<_N2) -> (E[(x6(_n2))**_k] <=E[(L)**k])
```



