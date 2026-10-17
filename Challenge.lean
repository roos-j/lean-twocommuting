/-
Copyright (c) 2026 Floris van Doorn, Polona Durcik, Lenka Slavíková, Joris Roos, Christoph Thiele. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
This file was assembled by Claude from the human-written files `TwoCommuting/Theorems.lean`.
No comments were added by Claude.
-/

module

public import Mathlib.Analysis.Complex.Norm
public import Mathlib.Dynamics.Ergodic.MeasurePreserving
public import Mathlib.MeasureTheory.Function.LpSeminorm.Defs

/-!
# Challenge file for Comparator
-/

public section

open MeasureTheory ENNReal Finset Filter Topology

variable {X : Type*} [MeasurableSpace X] {μ : Measure X} [IsProbabilityMeasure μ]

/-- Main pointwise a.e. convergence theorem for two commuting transformations -/
theorem pointwise_convergence_two_commuting {T S : X → X}
    (hT : MeasurePreserving T μ μ) (hS : MeasurePreserving S μ μ) (hTS : T ∘ S = S ∘ T)
    {p q : ℝ≥0∞} (hp : 1 ≤ p) (hq : 1 ≤ q) (hpq : p⁻¹ + q⁻¹ ≤ 1) {f g : X → ℂ}
    (hf : MemLp f p μ) (hg : MemLp g q μ) :
    ∀ᵐ x ∂μ, ∃ L, Tendsto
      (fun N : ℕ ↦ (N : ℂ)⁻¹ * ∑ n ∈ range N, f (T^[n] x) * g (S^[n] x)) atTop (𝓝 L) :=
  sorry

end
