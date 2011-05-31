(define (modpow-LSB x e m)
  (define (modmul x y)
    (remainder (* x y) m))
  (let ((len (integer-length e)))
    (let iter ((result 1)
           (x x)
           (i 0))
      (if (= i len)
      result
      (if (logbit? i e)
          (iter (modmul result x) (modmul x x) (+ i 1))
          (iter result (modmul x x) (+ i 1)))))))

(modpow-LSB 1234 5678 91011)

(define (modpow-MSB x e m)
  (define (modmul x y)
    (remainder (* x y) m))
  (define (modsq x)
    (remainder (* x x) m))
  (let ((len (integer-length e)))
    (let iter ((result x)
           (i (- len 2)))
      (if (< i 0)
      result
      (let ((sq (modsq result)))
        (iter
         (if (logbit? i e)
             (modmul sq x)
             sq)
         (- i 1)))))))

(modpow-MSB 1234 5678 91011)
