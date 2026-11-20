# Limpieza de Notion · 20/11/2026

Hecha por Claude con OK de Alex ("hazlo tú, confío en ti", "limpia todo"). Nada se borró: solo se cambiaron propiedades.
Para deshacer, basta con revertir las propiedades de los IDs de abajo (todos son páginas de Notion).

## Regla nueva (descripciones de las bases actualizadas)

- **"Por contactar"** es la base de trabajo del outbound 1:1: cada contacto vive ahí de principio a fin (Sin contactar → Contactado → Respondió / Cerrado sin éxito). No se copia a Prospectos.
- **Prospectos** queda como histórico del outbound hasta el 08/11 y para fichas de señales, inbound, referidos, reactivación y cartera.
- `Veredicto = Descartado` o `Acción siguiente = Ninguna` = no escribir.

## Prospectos (`collection://13d4b104-efef-4349-a37d-75405ae10799`)

**A. 24 duplicados** → `Rol en la cuenta = Ficha duplicada (fusionada)`, `Acción siguiente = Ninguna` (y `Veredicto = Descartado` en las 21 que estaban "Sin contactar").
- 20 personas que también estaban en "Por contactar" (15 ya contactadas desde allí entre el 05 y el 18/11; 5 sin contactar en ambas): Kalfrisa, Quinton, Recordati, Kensing, Dikar, Teatek, Aritex, Merkal, Comforsa, Calier, Ecoener, Bimédica, Medicare Pharma, Aguamac, Famara, Cenavisa, Peimsa, Kromschröder, LS Electric, Afelsa.
  IDs: 4079d5dc332781b68740d41b0797f681, 40d9d5dc3327810d9241eb8cfc941437, 4089d5dc332781b8b6acc8baf412218c, 40d9d5dc3327816eafede5f5c559f09d, 4079d5dc332781ecb03cc8b465385e8e, 4089d5dc332781ef9550d051d5321511, 40d9d5dc33278198b9acf47de3707d86, 40d9d5dc33278132aa93e3ee68b8baec, 40d9d5dc332781efb2d5ceac29844e74, 4109d5dc332781c0aa2ac10f9d7cc2b6, 40d9d5dc332781d48ba4c8f766d512fe, 4089d5dc33278139aa24e1f6d19178be, 4079d5dc3327818abbb8dc85368f3cd4, 4079d5dc33278194883efd761e0980cc, 4079d5dc332781d19058d79265454d7b, 40d9d5dc3327811ab20cd6abe90f17d0, 40d9d5dc332781a98a13f2ffc97351ec, 4089d5dc332781669e94d0ce0a4e85de, 4079d5dc3327819eaca8f922ee82fd09, 40d9d5dc3327814b9e6ce5da6f0906ce
- 4 copias repetidas dentro de Prospectos (se marca la más nueva o la "Sin contactar"): Cofarte 3df9d5dc33278143af99e57f30e7feb1, Miotech 3e69d5dc3327813ab30de223ccf324db, Fansifarm 3e69d5dc3327818c8004c3f46b06afae, Ingenut 3e69d5dc332781b0851bcc23901d6281

**B. 31 "Sin contactar" de empresas ya contactadas** (otra persona escribió, respondió o se cerró) → `Veredicto = Descartado`, `Acción siguiente = Ninguna`.
Cofares, Droguería Venezuela, Satocan, ELMASA, Fermon, ACJ, Coferdroza, mesoestetic (2), EM&E (2), Bet Solar (2), Ercros (2), Ingeteam, Novartis, Riversa, Menarini, Power Electronics, Xolertic, Eiffage, Bioiberica (2), MAPBiopharma (2), Dentaid (Anselm Bravo), Disop (2), Exclusivas Roca. **Finanzauto** (cliente, en exclusiones): además `Tipo = Cliente`.
IDs: 3e59d5dc3327811a9137cefc01be140b, 4029d5dc332781c5b403e7ed97a05a84, 4069d5dc33278161bec6db6dcf35c594, 4069d5dc332781f99f87fc755707ca27, 3ec9d5dc332781fa9798f59fc3f8b5f6, 3ec9d5dc332781918306f58d73e91e52, 4069d5dc33278182b67acf473ea343f7, 3e69d5dc33278100b85fc37d12c2d267, 3ec9d5dc332781bab89af6e620e53094, 3ec9d5dc332781e38a9cf8d5698826c7, 3df9d5dc3327817f95add11e617a9929, 3ec9d5dc332781c480f0d52b6143817f, 3ec9d5dc3327813ba20bd7c815b563b3, 3ec9d5dc332781a18fc9e0fb25495fb3, 3ec9d5dc33278106a4dbf48987084889, 3ec9d5dc3327818ba6cbdf6838c15b85 (Finanzauto), 3f39d5dc332781fa95c9dfddc02004ee, 3e49d5dc3327815a824ceb09f2570f33, 3ec9d5dc33278112bae4c4a9436655a4, 4089d5dc332781aca22eed63a8fd2db8, 4079d5dc332781aa8674eb0da3d8c509, 3ec9d5dc332781b986cbf5c43b254236, 3ec9d5dc3327815b93bfee29c59cbabd, 3e49d5dc33278184866ec8f624c6b736, 4079d5dc33278145968ed33288fe2d37, 3ec9d5dc3327813399feffe48e08970a, 3df9d5dc332781de864df5a795019f71, 3f49d5dc332781708a03c1785c0263f7, 3ec9d5dc33278116b19efefe234bfc42, 4019d5dc332781e89f3cd1dc278700f7, 4029d5dc332781d0aa82e055725a13ec

**C. Pendiente (cupo SQL de Notion agotado a media mañana):** cerrar como `Cerrado sin éxito` los **149 "Contactado" de Outlook 1:1 con recordatorio vencido entre el 03 y el 11/11** (sin respuesta tras 9-17 días). Criterio: `Estado = Contactado`, `Campaña = Outlook 1:1`, `Fecha recordatorio <= 2026-11-20`.

## Por contactar (`collection://4f2bc9fe-3fd6-4b47-b280-7373c66ce811`)

- **Segundo contacto de una empresa con la que ya se habla** → `Veredicto = Descartado`, `Acción siguiente = Ninguna`: Saioa Bollegui (Jeremias) 4079d5dc3327818f9823def918022a44; Judith Martinez (Erreka) 4079d5dc33278195903de936f835574f.
- **Personas que entraron en el hilo de un lead que ya respondió** (no escribir en frío; se trata dentro del hilo) → `Rol en la cuenta = Escalada`, `Acción siguiente = Ninguna`: Pascual Nieves (Parcitank) 4149d5dc332781e187c5f33b83d74695; Estela Palacios (DHV) 4169d5dc332781f284acd9739e0eaee2; Marcos de Castro (Tecoi) 41a9d5dc3327813bba1bc157468ed257; Eva Ferrándiz (Great Plastic) 41a9d5dc33278195a637e5b481af0785.

## Lo que no se tocó (y por qué)

- **98 "Contactado" con recordatorio vencido en "Por contactar"** (envíos del 09 al 12/11): son recientes; toca recordatorio, no cierre.
- **539 "Contactado" de Prospectos sin `Fecha primer envío`**: no hay forma fiable de saber la fecha.
- **~130 "Sin contactar" con email en Prospectos** (rutina oct–nov, Clay, Apollo): puede que algunas ya se enviaran desde Outlook sin marcarse. Sin acceso a Outlook desde Claude. `[POR COMPROBAR]`
- **145 "Sin contactar" sin email en Prospectos** (septiembre): se quedan como histórico.
