# VIAP
<img src="VIAP_logo.jpg" width=400 alt="Viap Logo" align="right">

Probalistic Program Verifier Integer Assignment Program(PbVIAP) translates a program to first-order logic with
quantifiers on natural numbers. 

### Awards & Achievements

Many more to come..

## Publications

1. [A Formalization of Programs in First-Order Logic with a Discrete Linear Order](http://www.sciencedirect.com/science/article/pii/S000437021630011X?via%3Dihub),Fangzhen Lin,Artificial Intelligence(2016)

1. [VIAP - automated system for verifying integer assignment programs with loops](https://github.com/VerifierIntegerAssignment/sv-comp/blob/master/viap-automated-system.pdf),Pritom Rajkhowa, Fangzhen Lin, 19th International Symposium on Symbolic and Numeric Algorithms for Scientific Computing,SYNASC 2017, Timisoara, Romania, September 21-24, 2017

1. [VIAP-Automated System for Verifying Integer Assignment Programs with Loops(Competition Contribution)](https://github.com/VerifierIntegerAssignment/sv-comp-1/blob/master/viap-automated-system.pdf), Pritom Rajkhowa, Fangzhen Lin, 7th International Competition on Software Verification (2018)(not part of TACAS proceeding)


# See below for system requirements, installation, usage, and everything else.

### Support

* If something is not working or missing, open an [issue](https://github.com/VerifierIntegerAssignment/VerifierIntegerAssignment.github.io/issues).

* As a last resort, send mail to 
  [Pritom Rajkhowa](mailto:pritom.rajkhowa@gmail.com), [Fangzhen Lin](mailto:flin@cs.ust.hk), or both.

* To stay informed about updates, you can either watch [VIAP](https://verifierintegerassignment.github.io/)'s Github page.




### System Requirements and Installation

In practice we have run VIAP on standard Ubuntu 18.04 LTS distribution. VIAP is provided as a set of binaries and libraries for
Ubuntu 18.04 LTS distribution. 

#### Download 


##### Clone over HTTPS:

 $ git clone https://github.com/pritomrajkhowa/PbVIAP
 
 #### Running PbVIAP


VIAP software verifier is run using the `viap_tool.py` tool in the viap directory.
For a given input C program, the tool checks for violations of user-provided
assertions. 

#### Running Command

PATH_TO_VIAP/pbviap_tool.py file

#### Output contains the string:
```
- set of axioms and json file
```






### Using The PbVIAP Tool

Next, we illustrate how to translate the following simple probalistic program using the PbVIAP
tool:

```C
// benchmarks/multidimensional/transpose.c
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

$pbviap/pbviap_tool.py  benchmarks/multidimensional/transpose.c

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




