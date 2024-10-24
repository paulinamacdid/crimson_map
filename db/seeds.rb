# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"


puts "cleaning the database first..."

Review.destroy_all
Favourite.destroy_all
Facility.destroy_all
User.destroy_all
Blog.destroy_all

puts "creating users..."

gabriela = User.create(email: "gabbyb@gmail.com", password: "123456", first_name: "Gabriela", last_name: "Propodopolis", age: 24)
pamela = User.create(email: "pamela@gmail.com", password: "123456", first_name: "Pamela", last_name: "Gordon", age: 34)
ivy = User.create(email: "ivy@gmail.com", password: "123456", first_name: "Ivy", last_name: "Johnson", age: 29)
melissa = User.create(email: "mel123@gmail.com", password: "123456", first_name: "Melissa", last_name: "Walter", age: 42)
abi = User.create(email: "abi123@gmail.com", password: "123456", first_name: "Abi", last_name: "Blenson", age: 46)

puts "creating facilities..."
oru = Facility.create!(address: "224-226 Kingston Rd, New Malden KT3 3RN",
                      business_owner: false,
                      rating: 4.0,
                      toilet: true,
                      sanitary_products: true,
                      baby_change: true,
                      quiet_place: true,
                      education: false,
                      name: "Oru",
                      opening_hours: "Open 08:30 - 16:00",
                      user: melissa,
                      image: "https://images.squarespace-cdn.com/content/v1/63d2989b2d4c0421d7d241d5/e002a445-b5a6-46a9-bd85-8c5e1033ded2/SRG_Oru_SUTTON_CROWDFUNDER_ORIGINAL-22.jpg")
sutton_library = Facility.create!(address: "St Nicholas Way, Sutton SM1 1EA",
                                  business_owner: false,
                                  rating: 4.0,
                                  toilet: true,
                                  sanitary_products: true,
                                  baby_change: true,
                                  quiet_place: true,
                                  education: true,
                                  name: "Sutton Library",
                                  opening_hours: "Open 09:00 - 17:00",
                                  user: melissa,
                                  image: "https://thedesignconcept.co.uk/media/24274/sutton_uk_006.jpg?mode=pad&width=1350&height=900&bgcolor=ffffff&rnd=131835698170000000")
dobbies = Facility.create!(address: "28 Willow Rd, New Malden KT3 3RS",
                          business_owner: true,
                          rating: 4.0,
                          toilet: true,
                          sanitary_products: false,
                          baby_change: true,
                          quiet_place: false,
                          education: false,
                          name: "Dobbies",
                          opening_hours: "Open 08:00 - 16:30",
                          user: melissa,
                          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPx6DmpdKa_5OLtnPCfyzPE2BxTTPgFFzvlQ&s")
carshalton_station = Facility.create!(address: "Carshalton SM5 2HW",
  business_owner: false,
  rating: 2.0,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Carshalton Station",
  opening_hours: "Open 06:00 - 00:00",
  user: melissa,
  image: "https://upload.wikimedia.org/wikipedia/commons/0/0e/Carshalton_Railway_Station_-_geograph.org.uk_-_1553600.jpg")
british_library = Facility.create!(address: "96 Euston Rd., London NW1 2DB",
  business_owner: true,
  rating: 4.5,
  toilet: true,
  sanitary_products: false,
  baby_change: true,
  quiet_place: true,
  education: true,
  name: "British Library",
  opening_hours: "Open 09:30 - 20:00",
  user: melissa,
  image: "https://wp.inews.co.uk/wp-content/uploads/2017/10/shutterstock_554370322-e1507803540641.jpg")
pret = Facility.create!(address: "Kingston Rd, New Malden KT3 3RX",
  business_owner: true,
  rating: 1.0,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Pret",
  user: ivy,
  opening_hours: "Open 07:30 - 19:00",
  image: "https://www.londondesigneroutlet.com/wp-content/uploads/2023/06/pret-a-manger-london-designer-outlet-00.jpg",)
bella_caffe = Facility.create!(address: "150 Kingston Rd, New Malden KT3 3RD",
  business_owner: false,
  rating: 2.0,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Bella Caffe",
  user: ivy,
  opening_hours: "Open 06:30 - 04:30",
  image: "https://lh3.googleusercontent.com/p/AF1QipOtzldFQ0ivO1zohl36AB_8C76qLNJ9DZAan5Pg=s1360-w1360-h1020",
)
mad_coffee_bar = Facility.create!(address: "61 Lind Rd, Sutton SM1 4PP",
  business_owner: false,
  rating: 4.0,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Mad Coffee Bar",
  user: ivy,
  opening_hours: "Open 07:00 - 18:00",
  image: "https://lh3.googleusercontent.com/p/AF1QipO0sIu4qAJU3iGkq10gPJRyPQ5M7nhGYr3AgqJb=s1360-w1360-h1020",
)
the_grove_womens_toilets = Facility.create!(address: "Carshalton SM5 3BB",
  business_owner: false,
  rating: 1.5,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "The Grove Women's Toilets",
  opening_hours: "Open 00:00 - 00:00",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipP7MkzZJd4wNNEHwELw-ureDD_cgvvLXGHrzvwC=s1360-w1360-h1020",
)
public_toilet_free = Facility.create!(address: "97 Banstead Rd, Carshalton SM5 3NP",
  business_owner: false,
  rating: 3.0,
  toilet: true,
  sanitary_products: false,
  baby_change: false,
  quiet_place: false,
  education: false,
  name: "Public Toilet £0 Free (Male / Female)",
  opening_hours: "Open 16:00 - 22:30",
  user: ivy,
  image: "https://lh3.googleusercontent.com/p/AF1QipOlWxA422fEgK500xx2_JvtbbFzqNh_v0sPx6GV=s1360-w1360-h1020",)
pulse_health_and_fitness = Facility.create!(address: "Nightingale Rd, Carshalton SM5 2EJ",
  business_owner: false,
  rating: 3.0,
  toilet: false,
  sanitary_products: true,
  baby_change: true,
  quiet_place: false,
  education: false,
  name: "Pulse Health & Fitness",
  opening_hours: "Open 06:30 - 21:00",
  user: ivy,
  image: "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/10/Pulse-Carshalton-193-scaled.jpg",
)
sheenas_free_little_library = Facility.create!(address: "51 Windsor Ave, New Malden KT3 5HE",
  business_owner: false,
  rating: 3.5,
  toilet: true,
  sanitary_products: true,
  baby_change: true,
  quiet_place: true,
  education: true,
  name: "Sheena’s Free Little Library",
  opening_hours: "Open 07:00 - 19:30",
  user: ivy,
  image: "data:image/jpeg;base64,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",)

puts "done, created #{Facility.count} facilities"

puts "creating reviews..."

Review.create!(comment: "Toilet works fine, but lacks comfort and features. Could definitely be improved.", rating: 3, facility: oru, user: gabriela)
Review.create!(comment: "Great toilet, always clean, but disappointed the free sanitary products were out last time.", rating: 3, facility: sutton_library, user: pamela)
Review.create!(comment: "What a lovely little library with free organic sanitary products. Sheena, the owner, even offered me a free hot chocolate. It was such a welcoming touch I'll definitely be back", rating: 5, facility: sheenas_free_little_library, user: pamela)
Review.create!(comment: "a surprisingly gorgeous spot to change sanitary products, great ambience, very clean, many toilets", rating: 4, facility: british_library, user: ivy)

puts "creating blogs..."

Blog.create!(title: "Endometriosis at work", content_preview: "One in six people with endometriosis have to leave the workplace and is a condition that costs the economy £8.2 billion per year in loss of work and healthcare costs.
                      This is unacceptable- nobody should face discrimination at work or risk losing their job because of their endometriosis, and we’re determined to work with the Government...", content: "One in six people with endometriosis have to leave the workplace and is a condition that costs the economy £8.2 billion per year in loss of work and healthcare costs.
                      This is unacceptable- nobody should face discrimination at work or risk losing their job because of their endometriosis, and we’re determined to work with the Government to ensure they protect those with menstrual health conditions in the new Bill.
                      Earlier this month, the Government introduced an Employment Rights Bill that aims to cut down on unfair working practices. Endometriosis UK welcomes the Bill, including measures to support those going through the menopause. But the Bill must go further to ensure measures are introduced to ensure those with endometriosis have the support and protections they need in the workplace.
                      Over the coming weeks and months, Endometriosis UK will be lobbying for changes to the Employment Rights Bill to ensure all those with menstrual health conditions, including endometriosis, have access to the support they need at work. We would like to see:
                      Menopause action plans extended to all those impacted by menstrual health conditions including endometriosis
                      Legislation to ensure workers with menstrual health conditions are treated fairly if they need short but intermittent time off work, as a result of their condition.
                      The Bill is due to receive its second reading in the House of Commons this afternoon (Monday 21st October 2024).
                      You can support the campaign by emailing your MP. Our easy-to-use template will generate an email to your MP using your postcode.",
                      author: "Sally Campbell", image: "https://www.endometriosis-uk.org/sites/default/files/2024-08/Endometriosis%20UK%20%282%29.png", url: "https://www.endometriosis-uk.org/new-campaign-endometriosis-work")

Blog.create!(title: "Faster Diagnosis for Endometriosis", content_preview: "According to the Royal College of nursing it takes women an average of 7.5 years from the onset of symptoms to an official diagnosis with Endometriosis. In my case no-one ever told me that periods are actually not supposed to be painful. Having the occasional painful period in my teens, it got worse and worse over time. I did not think much of it, it’s part of being a woman, right? At least that’s what they told us back in the nineties.
                      In the UK and most likely also globally, however, about ten percent of women suffer from Endometriosis, a painful chronic health condition caused by  tissue similar to the lining of the uterus growing outside of the uterus. So how do you get a diagnosis quickly, without having to wait over seven years...", content: "According to the Royal College of nursing it takes women an average of 7.5 years from the onset of symptoms to an official diagnosis with Endometriosis. In my case no-one ever told me that periods are actually not supposed to be painful. Having the occasional painful period in my teens, it got worse and worse over time. I did not think much of it, it’s part of being a woman, right? At least that’s what they told us back in the nineties.
                      In the UK and most likely also globally, however, about ten percent of women suffer from Endometriosis, a painful chronic health condition caused by  tissue similar to the lining of the uterus growing outside of the uterus. So how do you get a diagnosis quickly, without having to wait over seven years. Let me share my experience:

                      1.	See a doctor
                      This might sound silly, but a lot of women ignore pain when on their period. GPs are a central point of referral whenever we have health issues. They deal with a vast amount of different diseases and therefore look at the bigger picture. If you have doubts about being in a lot of pain while on your period, go and see your GP! They can give you pain medication to help you with the symptoms and refer you to a more specialised service. If your period pain makes you pass out or incapacitates you, it is a sign. You have the right to go to hospital and get some strong painkillers if it gets really bad.

                      2.	Be persistent
                      If a GP is dismissive and tells you that as long as you manage the pain it is all a-okay, you do not have to believe them. You can get a second opinion! But do not let them send you home without help. Pain is a natural reaction of the body that indicates that something is not okay, it should not be ignored. And by now, we should all know that pain during your period is a sign that something is wrong. Maybe the practice you go to has several doctors - request an appointment with one of the other practitioners. If you are unhappy with the health service of your current GP, you have the right to see another doctor. Trust your gut feeling, if someone is really dismissive or does not take you seriously, they might not be the right person to help you. But do not ignore pain and suffer in silence!

                      3.	Be informed
                      I would highly recommend doing your own research before going to see a doctor. Keep track of your periods and when the pain occurs, if you give a more detailed account of your pain and symptoms, the chances are that you will be taken more seriously. Ask explicitly about Endometriosis as the cause of pain. Sometimes it helps to point doctors in a certain direction in order to get a faster referral for diagnostics or a specialist. If you do not want to jump on a random treatment but want to see a specialist, it helps to have relevant information in order to insist on a referral.

                      4.	Don’t be disheartened
                      Usually, the GP will send you for an ultrasound. But a lot of cases of Endometriosis are not detected by ultrasound because it will only pick up large clumps of scar tissue or cysts. The ultrasound only provides a picture from within the uterus, so in cases where the Endometriosis has grown outside of it or is in less accessible places or even worse has grown into organs like the bladder, ureter, bowels or kidneys the scan will come back negative. Your pain however is still real and you deserve to find out the cause of it. Just because an ultrasound comes back without any result or diagnosis, does not mean your pain is not real.

                      5.	See a specialist
                      If you see your GP to discuss the results of an ultrasound and they say “We can’t do anything else for you” - it is time to see a specialist. If the doctor does not offer to refer you, ask for a referral to see a gynaecologist. They will be able to have a closer look at what is wrong and can get you other scans such as an MRI. Most cases of Endometriosis are only definitively diagnosed by surgery in which parts of it can be removed and your symptoms can be eased. It is a surgery that uses small incisions to insert the medical instruments and has very low rates of complications. If you decide against surgery the specialist can make a targeted treatment plan to help you manage your symptoms and give you the right hints towards an effective hormonal treatment.

                      6.	Be prepared
                      Oh boy, this counts for so many situations when you face a chronic illness. The list is long: Keep track of your periods, do not leave the house without pain killers when you know your period or ovulation will start soon, make sure you protect your stomach when taking large amounts of Ibuprofen to cope with excruciating pain (your doctor should be able to give you medication to protect your tummy!)... Most importantly when getting diagnosed though, write a list of questions to ask when seeing a gynaecologist or Endometriosis specialist. Seeing doctors can be stressful, so come prepared and do not let them rush you out of the door - ask all those questions! It all can be overwhelming, but preparing yourself will make it easier and give you the confidence to handle it all.

                      I hope this little list helps and encourages more women to get help for their pain. It took me one and a half years from first seeing my GP to getting an official diagnosis, but I suffered through years of unspecific pain in my legs, problems with my digestion and period cramps until it got so bad I could not bear it any more. Don’t let it get to that point but act faster and claim your normal life back!
                      ",
                      author: "Dorothea Toeller", image: "https://images.everydayhealth.com/images/seo-graphic-content-initiative/eh-how-endometriosis-affects-the-body-seo-graphic-gs.png?sfvrsn=a318d72f_3", url: "https://www.endometriosis-uk.org")

Blog.create!(title: "The Silent Transition: Discussing Perimenopause ", content_preview: "Women’s health has long stood in the shadows of medical research, lagging behind male-focused health treatment in ways that have left a lasting impact on half the population. Historically, health research and medical treatments were predominantly based on men’s physiology, with women’s unique health needs often relegated to secondary importance or outright ignored.
                      For centuries, topics such as menstruation, pregnancy, and menopause have been shrouded in silence, often discussed in hushed tones or labelled “women’s issues” rather than vital health concerns. These taboos have contributed to a dangerous gap in education and awareness. Many still struggle to identify symptoms of perimenopause, mistaking them for stress, aging, or other unrelated conditions.
                      A History of Gender Bias in Health Research...", content: "Women’s health has long stood in the shadows of medical research, lagging behind male-focused health treatment in ways that have left a lasting impact on half the population. Historically, health research and medical treatments were predominantly based on men’s physiology, with women’s unique health needs often relegated to secondary importance or outright ignored.
                      For centuries, topics such as menstruation, pregnancy, and menopause have been shrouded in silence, often discussed in hushed tones or labelled “women’s issues” rather than vital health concerns. These taboos have contributed to a dangerous gap in education and awareness. Many still struggle to identify symptoms of perimenopause, mistaking them for stress, aging, or other unrelated conditions.
                      A History of Gender Bias in Health Research
                      For much of history, medical research has treated the male body as the default, leaving the female body largely understudied. From the late 19th century to the mid-20th century, women were often excluded from clinical trials. Researchers claimed that women’s hormonal cycles made data too complicated to analyse, and concerns over the impact of studies on potential pregnancies also fuelled exclusion1. This male-centric approach persisted even when studying conditions that affect both genders, leading to diagnostic disparities. For example, cardiovascular disease—long thought to be predominantly a male problem—presents differently in women, yet it took years of underdiagnosis and higher mortality rates among women before it was taken seriously2.
                      Women’s health was relegated to the domain of reproductive function, as if their bodies were solely valuable for procreation. Yet the cultural stigma around female bodies has compounded the medical neglect. Menstruation, pregnancy, and menopause remain taboo subjects in many cultures. This makes it difficult for women to talk openly about the changes they experience, even with their doctors.
                      This taboo extends to perimenopause, the transitional phase before menopause, which can begin as early as a woman's mid-30s or as late as her 50s. Since many women are unfamiliar with what perimenopause entails, they often don’t recognise its symptoms. A history of medical disregard means many women don’t seek professional attention, leaving countless women without proper support or treatment during a critical phase of their lives.
                      What Is Perimenopause?
                      Perimenopause is the period during which a woman’s body begins to transition toward menopause. It’s marked by fluctuating hormone levels—primarily oestrogen and progesterone—as the ovaries gradually produce less oestrogen. Perimenopause can last anywhere from several months to up to a decade before a woman reaches full menopause, which is defined as 12 consecutive months without a menstrual period.
                      The hormonal shifts during perimenopause can bring about a range of physical, emotional, and psychological symptoms. Yet because many of these symptoms can also be linked to other life factors—like stress or aging—many women are unaware that perimenopause is the root cause.
                      Common Symptoms
                      During perimenopause, women experience a variety of symptoms driven by hormonal fluctuations, many of which can be misdiagnosed. Periods may become irregular, and hot flashes or night sweats are common, often disrupting sleep and leaving women feeling fatigued. Mood swings, irritability, and feelings of anxiety or depression can intensify, adding to the emotional challenges of this transitional phase. Many women report developing new allergies, and, oddly, getting itchy ears due to dry skin.
                      As oestrogen levels decline, women begin to lose bone density at a faster rate, which can increase the risk of osteoporosis and fractures later in life. Muscle mass also tends to decrease, leading to reduced strength and a slower metabolism, which can contribute to weight gain. Cognitive changes, such as memory lapses or difficulty concentrating—commonly referred to as brain fog—are another challenging aspect of perimenopause. These cognitive shifts can leave women feeling mentally sluggish, making it harder to stay focused or recall information, which can be unsettling in both personal and professional contexts.
                      Treatment and Management Options
                      There are several approaches to managing perimenopause, depending on the severity of symptoms and individual needs. Hormone therapy (HT) is one option for women experiencing significant discomfort, as it can help regulate fluctuating hormone levels and alleviate issues like hot flashes, night sweats, and vaginal dryness. However, it's not suitable for everyone, and discussing the potential risks and benefits with a healthcare provider is essential.
                      For those who prefer or require non-hormonal options, certain medications, such as low-dose antidepressants, can help reduce symptoms like hot flashes and mood changes. Lifestyle changes are also highly effective in managing perimenopause. Regular exercise, especially weight-training, is crucial to maintain muscle and bone density. Reducing caffeine and alcohol helps improve sleep and reduces the frequency and intensity of hot flashes.
                      Breaking the Silence Around Perimenopause
                      Perimenopause, like many stages of a woman’s life, has been misunderstood and under-discussed for far too long. Greater awareness and education not only empower female patients, but they also help healthcare professionals. As more attention and funding go toward research and training, doctors and medical staff will be better equipped to correctly diagnose and treat perimenopause.
                      Encouraging open conversations about perimenopause in healthcare settings and in daily life with friends and family is key to dismantling the shame or uncertainty that surrounds this natural phase. The more we talk about perimenopause and other important women’s health issues, the more we will see improvements in treatment options, support systems, and overall understanding.
                      In the meantime, women must continue to advocate for themselves—pushing past societal discomfort to voice their health concerns and demand the care they deserve. Shining a light on these issues will benefit not only women navigating perimenopause but will also bring us closer to achieving equality in healthcare, ensuring that women can thrive at every stage of their lives.

                      1 Institute of Medicine (US) Committee on the Ethical and Legal Issues Relating to the Inclusion of Women in Clinical Studies. (1994). Women and Health Research: Ethical and Legal Issues of Including Women in Clinical Studies, Volume 1. National Academies Press.
                      2 U.S. General Accounting Office. (1990). NIH Research: Problems in Implementing Policy on Women in Study Populations.",

                      author: "Alba Cobas", image: "https://images.squarespace-cdn.com/content/v1/5566620be4b0f5a055effbe7/565cb603-8413-43cf-acbc-018c1d3d4d2d/Coming+to+terms+with+grief+and+loss+of+youth+and+fertility+not+having+children%2C+feeling+trapped+and+coping+with+anger+and+rage+at+others+in+menopause+during+midlife+with+extra+responsibilities.+Seek+tips+and+help+from+counselling+psychologist+Joanne+Collyer+in+Subiaco+Perth.png", url: "https://www.health.harvard.edu/womens-health/perimenopause-rocky-road-to-menopause")

puts "done, created #{Blog.count} blog"

api_token = ENV['GOOGLE_API_KEY']
url = "https://places.googleapis.com/$discovery/rest?version=v1&key=#{api_token}"
facilities_serialized = URI.parse(url).read
places = JSON.parse(facilities_serialized)

puts places
# places["places"].each do |place|
#   Facility.create!(name: place["places"], address:, opening_hours:, toilet: )
# # end
