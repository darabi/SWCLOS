;;; Demonstration2 for SWO
(in-package :gx)
(defResource Human (|rdf|:|type| |owl|:|Class|))
(defResource Pet (|rdf|:|type| |owl|:|Class|))
(defResource Cat (|rdf|:|type| |owl|:|Class|)
  (|rdfs|:|subClassOf| Pet))
(defIndividual John (|rdf|:|type| Human)
  (Knows Jane)
  (Knows Leonid)
  (Knows Elizabeth))
(defIndividual Jane (|rdf|:|type| Human))
(defIndividual Leonid (|rdf|:|type| Human))
(defIndividual Elizabeth (|rdf|:|type| Cat))
;;;--------------------------------------
*(<- (Hates John ?x) (Human ?x) (Knows John ?x))
*(<- (Likes John ?x) (Pet ?x) (Knows John ?x))
;; query
*(?- (Hates John ?x))
*(?- (Likes ?x ?y))
;;;---------------------------------------
(tunify '(Knows John ?x) '(Knows John Jane))
(tunify '(Knows John ?x) '(Knows ?y Leonid))
(tunify '(Knows John ?x) '(Knows ?y Elizabeth))
(tunify '(Knows John ?x) '(Knows ?y Elizabeth)
        `((?x ,Human)))
(defResource Pet
    (|owl|:|disjointWith| Human))
(tunify '(Knows John ?x) '(Knows ?y Elizabeth)
        `((?x ,Human)))
(tunify '(HasChild ?x ?y) '(HasChild John Elizabeth))
(tunify '(HasChild John ?y) '(HasChild ?x Elizabeth))
(tunify '(HasChild ?x ?y) '(HasChild John Elizabeth)
        `((?x ,Cat) (?y ,Cat)))
(tunify '(HasChild ?x ?y) '(HasChild John Elizabeth)
        `((?x ,Human) (?y ,Cat)))
;;;---------------------------------------------------
(defResource Vehcle (|rdf|:|type| |owl|:|Class|))
(defResource Car (|rdf|:|type| |owl|:|Class|)
  (|rdfs|:|subClassOf| Vehcle))
(defResource Ship (|rdf|:|type| |owl|:|Class|)
  (|rdfs|:|subClassOf| Vehcle))
(defResource AmphibiousVehcle (|rdf|:|type| |owl|:|Class|)
  (|owl|:|intersectionOf| Car Ship))
(defIndividual MyCar (|rdf|:|type| Car))

(tunify '(MyCar) '(?y) `((?y Ship)))
