(set-logic QF_SHID)

(set-info :source |
Jens Katelaan, Harrsh, https://bitbucket.org/jkatelaan/harrsh
|)
(set-info :smt-lib-version 2.6)
(set-info :category "crafted")
(set-info :status sat)
(set-info :version "2018-06-18")

;; Nested singly-linked list of acyclic singly-linked lists


; Sorts for locations, one by cell sort
(declare-sort RefNLL_lvl1_t 0)
(declare-sort RefNLL_lvl2_t 0)

; Types of cells in the heap

(declare-datatypes (
	(NLL_lvl1_t 0)
	(NLL_lvl2_t 0)
	) (
	((c_NLL_lvl1_t (next1 RefNLL_lvl1_t) ))
	((c_NLL_lvl2_t (next2 RefNLL_lvl2_t) (down RefNLL_lvl1_t) ))
	)
)

; Type of heap

(declare-heap (RefNLL_lvl1_t NLL_lvl1_t) (RefNLL_lvl2_t NLL_lvl2_t) 
)

;; Possibly cyclic nonempty singly-linked lists
(define-fun-rec nell ((in RefNLL_lvl1_t)(out RefNLL_lvl1_t)) Bool
	(or 
		(pto in (c_NLL_lvl1_t out))

		(exists ((u RefNLL_lvl1_t))
	 
		(sep 
			(pto in (c_NLL_lvl1_t u ))
			(nell u out )
		)
		)
	)
)

;; Nested singly-linked list of acyclic singly-linked lists
(define-fun-rec ncll ((in RefNLL_lvl2_t)(out RefNLL_lvl2_t)) Bool
	(or 
		(and 
			(= in out)
			(_ emp RefNLL_lvl2_t NLL_lvl2_t)
		)

		(exists ((u RefNLL_lvl2_t)(h RefNLL_lvl1_t))
	 
		(sep 
			(pto in (c_NLL_lvl2_t u h ))
			(nell h h)
			(ncll u out)
		)

		)
	)
)


(check-sat) 
;; variables
(declare-const x0 RefNLL_lvl2_t)

(assert (ncll x0 (as nil RefNLL_lvl2_t))
)

(check-sat)

