(set-logic QF_BSL)
(set-info :source | CVC4 - Andrew Reynolds |)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status sat)


(declare-sort Loc 0)
(declare-const c0 Loc)
(declare-datatypes (
        (Node 0)
        ) (
        ((node (data Loc) (next Loc)))
        )
)
(declare-heap (Loc Node))

(declare-const w Loc)
(declare-const u1 Loc)
(declare-const u2 Loc)
(declare-const u3 Loc)
(declare-const u4 Loc)
(declare-const u5 Loc)
(declare-const u6 Loc)
(declare-const u7 Loc)

(declare-const nx1 Loc)
(declare-const nx2 Loc)
(declare-const dt1 Loc)
(declare-const node0 Node)

;------- f -------
(assert (= nx1 u1))
(assert (= nx2 u1))
(assert (= dt1 c0))
(assert (= node0 (node c0 u1)))
;-----------------

(assert (sep (pto w (node c0 u1)) (pto u1 (node c0 u2)) (pto u2 (node c0 u3)) (pto u3 (node c0 u4)) (pto u4 (node c0 u5)) (pto u5 (node c0 u6)) (pto u6 (node c0 u7)) (pto u7 (node c0 (as nil Loc)))))

(assert (not (and (sep (pto w (node c0 nx2)) true) (and (sep (sep (pto nx1 (node c0 u2)) (pto u2 (node c0 u3)) (pto u3 (node c0 u4)) (pto u4 (node c0 u5)) (pto u5 (node c0 u6)) (pto u6 (node c0 u7)) (pto u7 (node c0 (as nil Loc)))) (pto w node0)) (sep (pto w (node dt1 nx1)) true)))))

(check-sat)
;(get-model)
