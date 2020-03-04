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
(E[(y2(_N1(_n2),_n2) >M)**k])
(_n1<_N1(_n2)) -> (E[(y2(_n1,_n2) <=M)**k])
E[(y6((_n2+1)))**_h] = E[(y2(_N1(_n2),_n2))**_k]
E[(x6((_n2+1)))**_h] = (E[(x6(_n2) +RV(uniform,-(0.100000000000000),0.200000000000000))**k])
E[(k6((_n2+1)))**_h] = (E[(k6(_n2) +1)**k])
E[(y6(0))**_h] = E[(0)**_k]
E[(x6(0))**_h] = E[(0)**_k]
E[(k6(0))**_h] = E[(0)**_k]
(E[(x6(_N2) >L)**k])
(_n2<_N2) -> (E[(x6(_n2) <=L)**k])
