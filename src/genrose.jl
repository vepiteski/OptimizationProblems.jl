# Generalized Rosenbrock function.
#
#   Source: 
#   Y.-W. Shang and Y.-H. Qiu,
#   A note on the extended Rosenbrock function,
#   Evolutionary Computation, 14(1):119–126, 2006.
#
# Shang and Qiu claim the "extended" Rosenbrock function
# previously appeared in
#
#   K. A. de Jong,
#   An analysis of the behavior of a class of genetic
#   adaptive systems,
#   PhD Thesis, University of Michigan, Ann Arbor,
#   Michigan, 1975,
#   (http://hdl.handle.net/2027.42/4507)
#
# but I could not find it there, and in
#
#   D. E. Goldberg,
#   Genetic algorithms in search, optimization and
#   machine learning,
#   Reading, Massachusetts: Addison-Wesley, 1989,
#
# but I don't have access to that book.
#
# This unconstrained problem is analyzed in
#
#   S. Kok and C. Sandrock,
#   Locating and Characterizing the Stationary Points of
#   the Extended Rosenbrock Function,
#   Evolutionary Computation 17, 2009.
#   https://dx.doi.org/10.1162%2Fevco.2009.17.3.437
# 
#   classification SUR2-AN-V-0
#
# D. Orban, Montreal, 08/2015.

export genrose, rosenbrock

"Generalized Rosenbrock model in size `n`"
function genrose(n :: Int=100)

  n < 2 && error("genrose: number of variables must be ≥ 2")

  nlp = Model()

  @defVar(nlp, x[i=1:n], start=(i/(n+1)))

  @setNLObjective(
    nlp,
    Min,
    1.0 + 100 * sum{(x[i+1] - x[i]^2)^2, i=1:n-1} + sum{(x[i] - 1.0)^2, i=1:n-1}
  )

  return nlp
end


"Classic Rosenbrock problem"
rosenbrock(n::Int=2) =  genrose(2)
