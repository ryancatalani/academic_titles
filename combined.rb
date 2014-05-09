require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'marky_markov'

class AcademicTitles < Sinatra::Application

	configure do
		markov = MarkyMarkov::TemporaryDictionary.new
		markov.parse_file "4cscombined.txt"
		set :markov, markov
	end

	get '/' do
		key_words = %w(
			epistemology
			epistemic
			pedagogy
			pedagogical
			ontology
			ontological
			praxis
			translingual
			transmodal
			multilingual
			multimodal
			representation
			representations
			coercion
			disruption
			decolonize
			decolonization
			narrative
			narratology
			crossroads
			arena
			oppresive
			oppression
			postcolonial
			postcolonialism
			feminist
			feminism
			globalism
			intersection
			borderland
			appropriation
			landscape
			brokering
			brokers
			disrupt
			problematizing
			problematization
			hegemony
			hegemonic
			dominant
			patriarchy
			foucaultian
			sophistic
			kantian
			ciceronian
			ideology
			ideological
			neoliberal
			capitalism
			functionalism
			modernization
			structuralism
			structuralist
			methodology
			methodological
			paradigm
			agency
			projectivity
			metrolingual
			discourse
			socioeconomic
			marginalization
			marginalize
			stakeholders
			orientalism
			othering
			aggression
			revolution
			demogogy
			monolithic
			demographic
			sectarian
			sectarianism
			spatial
			gap
			disequilibrium
			normative
			diversity
			competence
			comeptencies
			vis-a-vis
			accomodation
			outcome
			outcomes
			zone
			niche
			translocal
			transdisciplinarity
			socioemotional
			metacognitive
			intersectionality
			interdisciplinary
			proficiency
			proficiencies
			autochthonous
			allochthonous
			textual
			hybridity
			marxism
			qua
			expropriation
			sedimentation
			teleological
			teleology
			autonomous
			autonomy
			vernacular
			value-ridden
			code-switching
			code-meshing
			paradox
			paradoxical
			polyglot
			monoglot
			affordance
			elitist
			utopian
			distopian
			mythicism
			physiognomy
		)

		prefixes = %w{
			anti
			post
			poly
			bi
			socio
			trans
			multi
			micro
			macro
			quasi
			meta
			inter
			neo
		}

		suffixes = %w{
			ology
			ism
			istic
			ist
		}

		20.times do
			arr = markov.generate_n_words(rand(5)+4).split(' ')
			arr = arr.insert( rand(arr.count), key_words.sample.capitalize )
			if rand(5) == 0
				idx = rand(arr.count)
				arr[idx] = prefixes.sample.capitalize + arr[idx].downcase
			end
			if rand(10) == 0
				idx = rand(arr.count)
				arr[idx] = arr[idx] + suffixes.sample
			end
			str = arr.join(' ')
			puts str
			puts ''
		end
	end

end