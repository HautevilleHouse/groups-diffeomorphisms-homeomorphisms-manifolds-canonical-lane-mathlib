import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure HomeomorphismGroupAction (X : Type u) [TopologicalSpace X] where
  group : Type v
  groupMul : group → group → group
  groupUnit : group
  groupInv : group → group
  action : group → X → X
  actionCompat : ∀ g h x, action (groupMul g h) x = action g (action h x)
  actionUnit : ∀ x, action groupUnit x = x
  continuousAction : ∀ g, Continuous (action g)

structure HomeomorphismGroupActionEvidence (X : Type u) [TopologicalSpace X] (A : HomeomorphismGroupAction X) where
  actionCompatClosed : A.actionCompat
  actionUnitClosed : A.actionUnit
  continuousActionClosed : A.continuousAction

def HomeomorphismGroupActionClosed (X : Type u) [TopologicalSpace X] (A : HomeomorphismGroupAction X) : Prop :=
  A.actionCompat ∧ A.actionUnit ∧ A.continuousAction

theorem homeomorphism_group_action_closed_from_evidence (X : Type u) [TopologicalSpace X] (A : HomeomorphismGroupAction X) (E : HomeomorphismGroupActionEvidence X A) : HomeomorphismGroupActionClosed X A := by
  exact And.intro E.actionCompatClosed (And.intro E.actionUnitClosed E.continuousActionClosed)

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse