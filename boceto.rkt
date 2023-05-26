#lang racket

(require 2htdp/universe)
(require 2htdp/image)

(define MODELO-RECT (rectangle 50 150 "solid" "magenta"))
(define MODELO-NINJA-SALTO (bitmap "assets/ninja-en-pose.png"))
(define MODELO-NINJA-PARADO (bitmap "assets/ninja-parado.png"))


;ESTRUCTURA
(define-struct P [xpos ypos anim]) ; xpos2 ypos2

;FUNCIONES AUX.




(define (ventana s)
  (place-image (P-anim s)
               (P-xpos s) (P-ypos s)
               (above (rectangle 800 300 "solid" "blue")
                      (rectangle 800 150 "solid" "darkgray"))
               )
  )

(define (teclao s a-key)
  (cond
    [(key=? a-key "d") (make-P (+ (P-xpos s) 10) (P-ypos s) (P-anim s))]
    [(key=? a-key "a") (make-P (- (P-xpos s) 10) (P-ypos s) (P-anim s))]
    [(and (key=? a-key " ") (>= (P-ypos s) 150)) (make-P (P-xpos s) (- (P-ypos s) 10) (P-anim s))]
    [else s]
    )
  )


(define (tiktak s)
  (if (< (P-ypos s) 225)
    (make-P (P-xpos s) (+ (P-ypos s) 0.1) MODELO-NINJA-SALTO)
    (make-P (P-xpos s) (P-ypos s) MODELO-NINJA-PARADO)
  )
)


(big-bang (make-P 200 225 MODELO-NINJA-PARADO)
  [on-draw ventana]
  [on-key teclao]
  [on-tick tiktak 0.001]
  )