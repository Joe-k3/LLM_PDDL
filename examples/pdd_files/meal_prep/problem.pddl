(define (problem prepare_ingredients_problem)
  (:domain robot1)
  (:objects
    robot1 - robot
    lettuce - object
    tomato - object
    knife - object
    counterTop - object
  )
  (:init
    (at robot1 counterTop)
    (at-location lettuce counterTop)
    (at-location tomato counterTop)
    (at-location knife counterTop)
  )
  (:goal
    (and
      (sliced lettuce)
      (sliced tomato)
    )
  )
)