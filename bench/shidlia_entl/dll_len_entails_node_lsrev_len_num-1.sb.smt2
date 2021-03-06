(set-logic SHIDLIA)
(set-info :source | Songbird - https://songbird-prover.github.io/ |)
(set-info :smt-lib-version 2)
(set-info :category "crafted")
(set-info :status unsat)

;; singleton heap

(declare-sort Refnode 0)

(declare-datatypes
 ((node 0))
 (((c_node (next Refnode) (prev Refnode)))))

(declare-heap (Refnode node))

;; heap predicates

(define-fun-rec dll ((hd_2 Refnode) (p_3 Refnode) (tl_4 Refnode) (n_5 Refnode) (len_6 Int)) Bool
  (or
   (and
    (pto hd_2 (c_node n_5 p_3))
    (and
     (= (+ len_6 (- 1)) 0)
     (= hd_2 tl_4)))
   (exists
    ((x_7 Refnode))
    (and
     (sep
      (pto hd_2 (c_node x_7 p_3))
      (dll x_7 hd_2 tl_4 n_5 (+ len_6 (- 1))))
     (<= 1 (+ len_6 (- 1)))))))

;; heap predicates

(define-fun-rec lsrev ((x_8 Refnode) (y_9 Refnode) (len_10 Int)) Bool
  (or
   (and
    (_ emp Refnode node)
    (and
     (= len_10 0)
     (= x_8 y_9)))
   (exists
    ((anon_11 Refnode) (u_12 Refnode))
    (and
     (sep
      (pto u_12 (c_node y_9 anon_11))
      (lsrev x_8 u_12 (+ len_10 (- 1))))
     (<= 0 (+ len_10 (- 1)))))))

(check-sat)

;; entailment: dll(x,y,z,t,100) |- (exists u. x->node{u,y} * lsrev(u,t,99))

(declare-const x Refnode)
(declare-const y Refnode)
(declare-const z Refnode)
(declare-const t Refnode)

(assert
 (dll x y z t 100))

(assert
 (not
  (exists
   ((u Refnode))
   (sep
    (pto x (c_node u y))
    (lsrev u t 99)))))

(check-sat)
