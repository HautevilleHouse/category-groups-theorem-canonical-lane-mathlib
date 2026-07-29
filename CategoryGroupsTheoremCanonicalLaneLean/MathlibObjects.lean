import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryGroupsTheoremCanonicalLaneLean

structure CategorySpace where
  carrier : Type
  structure : CategoryStruct carrier

structure CategoryGroupsAdmittedObject where
  space : CategorySpace
  groupObject : Type
  groupCategory : CategoryStruct groupObject
  homSet : groupObject → groupObject → Type
  composition : ∀ {a b c : groupObject}, homSet a b → homSet b c → homSet a c
  identity : ∀ (a : groupObject), homSet a a
  associativity : Prop
  identityLaw : Prop
  conclusion : associativity ∧ identityLaw

def CategoryGroupsWitnessClosed (O : CategoryGroupsAdmittedObject) : Prop :=
  O.conclusion

end CategoryGroupsTheoremCanonicalLaneLean
end HautevilleHouse
