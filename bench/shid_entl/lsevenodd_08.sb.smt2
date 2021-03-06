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

(define-funs-rec (
	(ls ((x_1 Refnode) (y_2 Refnode)) Bool)
	(ls_even ((x_4 Refnode) (y_5 Refnode)) Bool)
	(ls_odd ((x_7 Refnode) (y_8 Refnode)) Bool)
		)
		(
  (or
   (and
    (_ emp Refnode node)
    (= x_1 y_2))
   (exists
    ((u_3 Refnode))
    (sep
     (pto x_1 (c_node u_3))
     (ls u_3 y_2))))

;; heap predicates

  (or
   (and
    (_ emp Refnode node)
    (= x_4 y_5))
   (exists
    ((u_6 Refnode))
    (sep
     (pto x_4 (c_node u_6))
     (ls_odd u_6 y_5))))

;; heap predicates

  (or
   (pto x_7 (c_node y_8))
   (exists
    ((u_9 Refnode))
    (sep
     (pto x_7 (c_node u_9))
     (ls_even u_9 y_8))))
     		)
)

;; heap predicates

(define-fun-rec ls_all ((x_10 Refnode) (y_11 Refnode)) Bool
  (or
   (ls_even x_10 y_11)
   (ls_odd x_10 y_11)))

(check-sat)

;; entailment: y->node{z} * ls_even(x,y) * ls_even(z,t) |- (exists x1. x1->node{t} * ls_even(x,x1))

(declare-const y Refnode)
(declare-const z Refnode)
(declare-const x Refnode)
(declare-const t Refnode)

(assert
 (sep
  (pto y (c_node z))
  (ls_even x y)
  (ls_even z t)))

(assert
 (not
  (exists
   ((x1 Refnode))
   (sep
    (pto x1 (c_node t))
    (ls_even x x1)))))

(check-sat)
