#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define (ventana s)
  (place-image (rectangle 50 150 "solid" "magenta")
               s 225
               (above (rectangle 800 300 "solid" "white")
                      (rectangle 800 150 "solid" "darkgray"))
               )
  )

(define (teclao s a-key)
  (cond
    [(key=? a-key "d") (+ s 5)]
    [(key=? a-key "a") (- s 5)]
    [else s]
    )
  )

(big-bang 200
  [on-draw ventana]
  [on-key teclao]
  )