(set-logic QF_BSL)
(set-info :source | CVC4 - Andrew Reynolds |)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status sat)

(declare-sort Loc 0)

(declare-heap (Loc Loc))

(declare-const loc0 Loc)

(declare-const w Loc)
(declare-const u1 Loc)
(declare-const u2 Loc)
(declare-const u3 Loc)

(declare-const w1 Loc)
(declare-const w2 Loc)
(declare-const w3 Loc)
(declare-const w4 Loc)

;------- f -------
(assert (= w1 u2))
(assert (= w2 u3))
(assert (= w3 u1))
(assert (= w4 u1))
;-----------------

(assert (sep (pto w u1) (pto u1 u2) (pto u2 u3) (pto u3 (as nil Loc))))
(assert (not (and (sep (sep (pto w4 w1) (pto w1 w2) (pto w2 (as nil Loc))) (pto w w3)) (sep (pto w w4) true))))

(check-sat)
;(get-model)
