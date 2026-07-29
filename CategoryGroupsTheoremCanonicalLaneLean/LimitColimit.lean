import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure LimitColimitPackage where
  diagram : Type u
  limitExists : Prop
  colimitExists : Prop
  universalProperty : Prop
  uniquenessUpToIsomorphism : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyClosed : L.universalProperty
  uniquenessUpToIsomorphismClosed : L.uniquenessUpToIsomorphism

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalProperty ∧ L.uniquenessUpToIsomorphism

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage) (E : LimitColimitEvidence L) :
    LimitColimitClosed L := by
  exact And.intro E.limitExistsClosed
    (And.intro E.colimitExistsClosed
      (And.intro E.universalPropertyClosed E.uniquenessUpToIsomorphismClosed))

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse