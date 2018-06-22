(set-logic QF_SHIDLIA)
(set-info :source | Songbird - https://songbird-prover.github.io/ |)
(set-info :smt-lib-version 2)
(set-info :category "crafted")
(set-info :status unsat)

;; singleton heap

(declare-sort Refnode 0)

(declare-datatypes
 ((node 0))
 (((c_node (next Refnode)))))

(declare-heap (Refnode node))

;; heap predicates

(define-fun-rec ls ((x_1 Refnode) (y_2 Refnode) (n_3 Int)) Bool
  (or
   (and
    (_ emp Refnode node)
    (and
     (= n_3 0)
     (= x_1 y_2)))
   (exists
    ((u_4 Refnode))
    (and
     (sep
      (pto x_1 (c_node u_4))
      (ls u_4 y_2 (+ n_3 (- 1))))
     (<= 0 (+ n_3 (- 1)))))))

(check-sat)

;; entailment: ls(x,y,1000) * ls(y,z,1000) |- ls(x,z,2000)

(declare-const x Refnode)
(declare-const y Refnode)
(declare-const z Refnode)

(assert
 (sep
  (ls x y 1000)
  (ls y z 1000)))

(assert
 (not
  (ls x z 2000)))

(check-sat)
