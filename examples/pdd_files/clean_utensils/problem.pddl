(define (problem clean_utensils_problem)
  (:domain robot2)
  (:objects
    robot2 - robot
    bowl - object
    cup - object
    plate - object
    sink - object
    counterTop - object
  )
  (:init
    (at robot2 counterTop)
    (at-location bowl counterTop)
    (at-location cup counterTop)
    (at-location plate counterTop)
  )
  (:goal
    (and
      (cleaned robot2 bowl)
      (cleaned robot2 cup)
      (cleaned robot2 plate)
    )
  )
)