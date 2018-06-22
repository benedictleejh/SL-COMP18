(set-logic QF_BSL)
(set-info :source | CVC4 - Andrew Reynolds |)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status sat)


(declare-sort Loc 0)
;
(declare-datatypes (
                (Node 0)
                ) (
                (
                (node (left Loc) (right Loc))
                )
                )
)
(declare-heap (Loc Node))


(declare-const root Loc)
(declare-const yl Loc)
(declare-const yr Loc)
(declare-const tl0 Loc)
(declare-const tr0 Loc)
(declare-const tl00 Loc)
(declare-const tr00 Loc)
(declare-const tl01 Loc)
(declare-const tr01 Loc)
(declare-const tl1 Loc)
(declare-const tr1 Loc)
(declare-const tl10 Loc)
(declare-const tr10 Loc)
(declare-const tl11 Loc)
(declare-const tr11 Loc)
(declare-const xl Loc)
(declare-const xr Loc)
(declare-const xl0 Loc)
(declare-const xr0 Loc)
(declare-const xl00 Loc)
(declare-const xr00 Loc)
(declare-const xl01 Loc)
(declare-const xr01 Loc)
(declare-const xl1 Loc)
(declare-const xr1 Loc)
(declare-const xl10 Loc)
(declare-const xr10 Loc)
(declare-const xl11 Loc)
(declare-const xr11 Loc)

(define-fun dist_tree3 ((y Loc)) Bool (or (and (= y (as nil Loc)) (_ emp Loc Node)) (and (distinct yl yr) (sep (pto y (node yl yr)) (or (and (= yl (as nil Loc)) (_ emp Loc Node)) (sep (pto yl (node tl0 tr0)) (or (and (= tl0 (as nil Loc)) (_ emp Loc Node)) (sep (pto tl0 (node tl00 tr00)) (and (= tl00 (as nil Loc)) (_ emp Loc Node)) (and (= tr00 (as nil Loc)) (_ emp Loc Node)))) (or (and (= tr0 (as nil Loc)) (_ emp Loc Node)) (sep (pto tr0 (node tl01 tr01)) (and (= tl01 (as nil Loc)) (_ emp Loc Node)) (and (= tr01 (as nil Loc)) (_ emp Loc Node)))))) (or (and (= yr (as nil Loc)) (_ emp Loc Node)) (sep (pto yr (node tl1 tr1)) (or (and (= tl1 (as nil Loc)) (_ emp Loc Node)) (sep (pto tl1 (node tl10 tr10)) (and (= tl10 (as nil Loc)) (_ emp Loc Node)) (and (= tr10 (as nil Loc)) (_ emp Loc Node)))) (or (and (= tr1 (as nil Loc)) (_ emp Loc Node)) (sep (pto tr1 (node tl11 tr11)) (and (= tl11 (as nil Loc)) (_ emp Loc Node)) (and (= tr11 (as nil Loc)) (_ emp Loc Node))))))))))

(define-fun tree3 ((x Loc)) Bool (or (and (= x (as nil Loc)) (_ emp Loc Node)) (sep (pto x (node xl xr)) (or (and (= xl (as nil Loc)) (_ emp Loc Node)) (sep (pto xl (node xl0 xr0)) (or (and (= xl0 (as nil Loc)) (_ emp Loc Node)) (sep (pto xl0 (node xl00 xr00)) (and (= xl00 (as nil Loc)) (_ emp Loc Node)) (and (= xr00 (as nil Loc)) (_ emp Loc Node)))) (or (and (= xr0 (as nil Loc)) (_ emp Loc Node)) (sep (pto xr0 (node xl01 xr01)) (and (= xl01 (as nil Loc)) (_ emp Loc Node)) (and (= xr01 (as nil Loc)) (_ emp Loc Node)))))) (or (and (= xr (as nil Loc)) (_ emp Loc Node)) (sep (pto xr (node xl1 xr1)) (or (and (= xl1 (as nil Loc)) (_ emp Loc Node)) (sep (pto xl1 (node xl10 xr10)) (and (= xl10 (as nil Loc)) (_ emp Loc Node)) (and (= xr10 (as nil Loc)) (_ emp Loc Node)))) (or (and (= xr1 (as nil Loc)) (_ emp Loc Node)) (sep (pto xr1 (node xl11 xr11)) (and (= xl11 (as nil Loc)) (_ emp Loc Node)) (and (= xr11 (as nil Loc)) (_ emp Loc Node)))))))))

;------- f -------
(assert (= yl xl))
(assert (= yr xr))
(assert (= tl0 xl0))
(assert (= tr0 xr0))
(assert (= tl00 xl00))
(assert (= tr00 xr00))
(assert (= tl01 xl01))
(assert (= tr01 xr01))
(assert (= tl1 xl1))
(assert (= tr1 xr1))
(assert (= tl10 xl10))
(assert (= tr10 xr10))
(assert (= tl11 xl11))
(assert (= tr11 xr11))
;-----------------

(assert (distinct root (as nil Loc)))
(assert (distinct yl (as nil Loc)))
(assert (distinct yr (as nil Loc)))
(assert (distinct tl0 (as nil Loc)))
(assert (distinct tr0 (as nil Loc)))
(assert (distinct tl1 (as nil Loc)))
(assert (distinct tr1 (as nil Loc)))

(assert (dist_tree3 root))
(assert (not (tree3 root)))

(check-sat)
;;(get-model)
