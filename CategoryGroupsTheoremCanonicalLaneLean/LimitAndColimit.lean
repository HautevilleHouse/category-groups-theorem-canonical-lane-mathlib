import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure LimitColimitPackage where
  diagram : Type u
  limitObject : Type v
  colimitObject : Type w
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop
  limitExistence : Prop
  colimitExistence : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit
  limitExistenceClosed : L.limitExistence
  colimitExistenceClosed : L.colimitExistence

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.universalPropertyLimit ∧ L.universalPropertyColimit ∧
  L.limitExistence ∧ L.colimitExistence

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage)
    (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.universalPropertyLimitClosed
    (And.intro E.universalPropertyColimitClosed
      (And.intro E.limitExistenceClosed E.colimitExistenceClosed))

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse
