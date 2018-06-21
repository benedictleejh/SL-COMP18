(set-logic SHID)
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

(define-fun-rec ls ((x_1 Refnode) (y_2 Refnode)) Bool
  (or
   (and
    (_ emp Refnode node)
    (= x_1 y_2))
   (exists
    ((u_3 Refnode))
    (sep
     (pto x_1 (c_node u_3))
     (ls u_3 y_2)))))

;; heap predicates

(define-fun-rec leven ((x_4 Refnode) (y_5 Refnode)) Bool
  (or
   (and
    (_ emp Refnode node)
    (= x_4 y_5))
   (exists
    ((u_6 Refnode))
    (sep
     (pto x_4 (c_node u_6))
     (lodd u_6 y_5)))))

;; heap predicates

(define-fun-rec lodd ((x_7 Refnode) (y_8 Refnode)) Bool
  (or
   (pto x_7 (c_node y_8))
   (exists
    ((u_9 Refnode))
    (sep
     (pto x_7 (c_node u_9))
     (leven u_9 y_8)))))

(check-sat)

;; entailment: leven(x,y) |- (exists t. leven(t,y) * leven(x,t))

(declare-const x Refnode)
(declare-const y Refnode)

(assert
 (leven x y))

(assert
 (not
  (exists
   ((t Refnode))
   (sep
    (leven t y)
    (leven x t)))))

(check-sat)