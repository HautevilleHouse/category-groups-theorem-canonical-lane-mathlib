import HautevilleHouse.CategoryGroupsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure LimitColimitPackage where
  limitExists : Prop
  colimitExists : Prop
  limitUniversalProperty : Prop
  colimitUniversalProperty : Prop
  functorPreservation : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  limitUniversalPropertyClosed : L.limitUniversalProperty
  colimitUniversalPropertyClosed : L.colimitUniversalProperty
  functorPreservationClosed : L.functorPreservation

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.limitUniversalProperty ∧ L.colimitUniversalProperty ∧ L.functorPreservation

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage) (E : LimitColimitEvidence L) :
    LimitColimitClosed L := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed
      (And.intro E.limitUniversalPropertyClosed
        (And.intro E.colimitUniversalPropertyClosed E.functorPreservationClosed)))

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse