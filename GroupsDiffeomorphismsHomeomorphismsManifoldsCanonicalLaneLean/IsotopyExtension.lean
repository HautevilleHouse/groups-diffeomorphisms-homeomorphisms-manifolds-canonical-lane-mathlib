import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure IsotopyExtension (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] where
  isotopy : ℝ × M → M
  isotopySmooth : Differentiable ℝ (uncurry isotopy)
  isotopyAtZero : ∀ x : M, isotopy (0, x) = x
  isotopyAtOne : ∀ x : M, isotopy (1, x) = x
  extensionProperty : ∀ t : ℝ, IsDiffeomorphism (isotopy t)

structure IsotopyExtensionEvidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (I : IsotopyExtension M) where
  isotopySmoothClosed : I.isotopySmooth
  isotopyAtZeroClosed : I.isotopyAtZero
  isotopyAtOneClosed : I.isotopyAtOne
  extensionPropertyClosed : I.extensionProperty

def IsotopyExtensionClosed (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (I : IsotopyExtension M) : Prop :=
  I.isotopySmooth ∧ I.isotopyAtZero ∧ I.isotopyAtOne ∧ I.extensionProperty

theorem isotopy_extension_closed_from_evidence (M : Type u) [TopologicalSpace M] [ChartedSpace ℝ M] (I : IsotopyExtension M) (E : IsotopyExtensionEvidence M I) : IsotopyExtensionClosed M I := by
  exact And.intro E.isotopySmoothClosed (And.intro E.isotopyAtZeroClosed (And.intro E.isotopyAtOneClosed E.extensionPropertyClosed))

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse