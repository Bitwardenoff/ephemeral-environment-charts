SELECT * FROM dbo.[User] WHERE Id IN ('13D8D3AB-F806-4AEB-A677-B07700307F85');
SELECT TOP(1) * FROM dbo.Organization
SELECT TOP(1) * FROM dbo.OrganizationUser
SELECT TOP(5) * FROM dbo.OrganizationApiKey
SELECT TOP(5) * FROM dbo.[GroupUser]
SELECT * FROM dbo.[User]

DELETE FROM dbo.OrganizationApiKey WHERE OrganizationId IN ('d1fae9db-77b0-4dd0-8ac0-b1ed010a807d');
DELETE FROM dbo.Organization WHERE Id IN ('d8897d52-f065-48f2-bde1-f5f41fa6ff9a');
DELETE FROM dbo.[Grant] WHERE SubjectId IN ('13d8d3ab-f806-4aeb-a677-b07700307f85')

-- Set Org ID to a generated ID
DECLARE @orgID UNIQUEIDENTIFIER
SET @orgID = NEWID();

-- Create the Org
INSERT INTO dbo.Organization (
    Id, Name, BusinessName, BillingEmail, [Plan], PlanType, Seats, MaxCollections, 
    UseGroups, UseDirectory, UseTotp, SelfHost, Storage, MaxStorageGb, Gateway, 
    GatewayCustomerId, GatewaySubscriptionId, Enabled, LicenseKey, ExpirationDate, 
    CreationDate, RevisionDate, BusinessAddress1, BusinessAddress2, BusinessAddress3, 
    BusinessCountry, BusinessTaxNumber, UsersGetPremium, UseEvents, Use2fa, 
    TwoFactorProviders, UseApi, UsePolicies, Identifier, ReferenceData, UseSso, 
    UseResetPassword, PublicKey, PrivateKey, OwnersNotifiedOfAutoscaling, 
    MaxAutoscaleSeats, UseKeyConnector, UseScim, UseCustomPermissions, 
    UseSecretsManager, Status, UsePasswordManager, SmSeats, SmServiceAccounts, 
    MaxAutoscaleSmSeats, MaxAutoscaleSmServiceAccounts, SecretsManagerBeta, 
    LimitCollectionCreationDeletion, AllowAdminAccessToAllCollectionItems
) VALUES (
    @orgID, 'Ephemeral Environments', NULL, 
    'mmartin+vault.usdev.bitwarden.pw@bitwarden.com', 'Enterprise (Annually)', 20, 100, 
    NULL, 1, 1, 1, 1, NULL, 10240, NULL, NULL, NULL, 1, 'DXfs66bVQjYiqN6uwiRB', 
    '2024-09-23 16:09:23.0000000', '2024-09-16 16:10:18.2200000', '2024-09-16 16:10:18.2200000', 
    NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, 1, NULL, 
    '{"id":null,"initiationPath":"Registration form"}', 1, 1, 
    'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAroMeUYdCaM/8Vun+oEaWPGQUd8SLxRuOK6A3+5vCW3VprnGnLUQ110f9EPvsjRmK+OM4tgwxAqVEP/T/MAJS9AFkPwjwmrmx8KGaqffJnabn9kro2tIrCJ78zZZ1L7/6eaRjNpVI9+cPH8vFgqsk3zXsfb8clwtN5FOeso4CHDOJ84u63K/TfwFI0ScOXNzXFRw1vLIy38v/ABaM5UcSDfkf0Y2cNyR6qUj85+ZyMeF+rZELFhx+T9C9FFA02XnM6sM34Ljg3jYL/+TT30KtgTktosjpfmqGhqTshFk3yiMnutwmJpnX3t/TYvi2ScenmB4PwJhYaPrDWN2v8BdmUQIDAQAB', 
    '2.esdK7dgH31fl2NrMtrYwhw==|j0JWyfCoIrB0IRGqcGf7RisDMFi+41kr9lKmf1jAGJXAsj7qzqfOlfHLvQ9ijk4z5hDuqkF7+FVcmXaHcYGiqpdCGVRC1pCchcBdZGKbiI7aYMCV0N9rLwJ0LJhRmMEBgAXgluAtdMSmND8+oPn6OBulhpkKRbZL6hAC3/XgNysrJN+/YzLxLfGCWVV9ml+X6DkTXDCVGxvshnvo3ZL042wqCdITsg5RimfdttjET92ctBICSwgRPCRgQH06UMRUswgMmV7p23a5Irk8HozWOqBiAyXAgwiweSCMqGiwF/n30hbrqFvK2B9wrTfAy6sgpEyYbXKW5GyX4rlm9pUllct0ZHnqdpemCKSEnrZE4VX3nPdwr3SiylGXMvmePIYN+QP7JXZHquln1N/eQTn1A/0cx1cGbrlx+o6qKEbAIrajoEA319b29YB7/23zRPanp5bJnvZE8esSBHWukcUJbHVmSdYA0GyrRvpQ/5kX6G7Y3aHkmAAAQ2Hd98jwFmghKtPGK1Kj5T8GrEV30Hys/1EQk9tC7kgCXizk8IiWV3kcaREn4q9xwjNddMP5JSAMsmXyBRylYKbVIwGYCo4VTVUljwzP57TG3cTWGIBCAZ4Tv/2NwdTHYJ94XU/1tZU0PToc0qNK/s+Am7SSvEJTHvaHR5vler8L/NxFvCGcY67JcdRM4pWsag5xIHlNdRfg/FMcoD+No+7Hro1iP5JbPG0ar7Ep2miWTTHq5gGxy/WqgYEnr1LDNVKeKkhzWpbRHU6zYUB2JwIcvG6ziKnEbzlB3KParMWB1uujobRklNAGgfecCMOczaFunJZcOBItVTonVlHZHbdUFRO82ozkmuqnCJTEpe00uK1VHgU+wl+LfpfVkHmKUupAB+TIYcj0nbTIy73VkzqfKa5FG9S8+mOwTbYx9q3MJLY6HJb01lRqH6nZQHqLaOG8pUfdDMxytKZNNNPrjoDaeXzSagpW45MI6/l/lUHKgDxmuOxOX6yJwqmtJpGTYVOfTgiMmjnjhQ2UJKaPS56IE/pMAR4nJVIOu2Tv60/RUWKoz14sJUqcstI/p1EJYIilW1HJLfn7mBb+y6Qbi8q/2JwdoR1HPBUOc83jxszwrV8sPkpG5epbsLq82VWZDPk/2fKfc6o99Ze/2Wy2n1WfsRNpgqfHPYfmd+HmDb8xuXNKfsr2k8hkfUH2YMaxGNxjLNP5k9YQTwmgk8jSDcv6sH172ENn7e6Yu/goWOOEDKMm4TM6G8nRsusY2hvQeXH8yX4i2EcBMjLNSciEyTW/1s6MlBVAdULoOnabXYk2mzKZYnzHPUeBonBMhvUxSxStgdS6SORBFK8kkTbkbdqdG/BBP3c2n+uUa2fvBlYtEKmdwMwP238bRyvmi3HaVO07RNZmifW5MXomoAt10YmNQGnnHo7Bi8qfX5+xhpuRI51BmhmUoZU0FUoMPs2Y0Jq/pBBVzcoAms7Vw2ylKB6cW4xO44lLzLXpJe+m421kDpZGAMNrkg2/YgNYKJfDOKWI0pOmHjEbsUWz2OXDJANcx9pbI5tLex3T+IocvaGYVDQnRWR6RmXywWu7PPOE+pl3jjWkU/NoiAFZyY23t0bwoEu/oq5pKzbKugqsztSIajb7cMfr8Vo=|GCXzkxPBJxfKttwh94BD6uM0c4ty3Dq+YOyVSZeLTO4=', 
    NULL, NULL, 0, 1, 1, 0, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0
);

-- Create the Org API key
INSERT INTO dbo.OrganizationApiKey(
    Id,
    OrganizationId,
    [Type],
    ApiKey,
    RevisionDate
) VALUES (
    NEWID(),
    @orgID,
    0,
    'QIXcOu3ukOA85dKKy6x5b0YzrEk3lI',
    '2024-09-16 16:10:18.3333333'
)

INSERT INTO dbo.OrganizationUser (
    Id, OrganizationId, UserId, Email, [Key], Status, Type, AccessAll, ExternalId, CreationDate, RevisionDate, Permissions, ResetPasswordKey, AccessSecretsManager
) VALUES (
    NEWID(), -- Generates a new unique identifier
    -- '9bb7643c-95b0-4794-b8e1-b1ed0116eac4', -- Example OrganizationId
    @orgID,
    '13d8d3ab-f806-4aeb-a677-b07700307f85', -- UserId from dbo.[User]
    'ee-user@bitwarden.com', -- Email from dbo.[User]
    '2.neopVv3CnmQbfTP97Myg8Q==|NDz5QxFNI3a34gS+OBxw7c4SdiIDu7FhPiFgxXNp8wqWRYscBX1LfNsjlvFAHWKwWNyGPKcSNCFwo7VUIpQdZtQ+t/09k7XSdONPII5nMZ/oOdeOggq4mmX1cbioLTRot+9SKlB8ajiO+WLfbYb7WtRRTbrKFOixUQXC/xbtFS/htWwr4IkDxT07WbfSjv9XX20SjPARKMM433eVoAP88+lr13qERdc42gRvvVvnduCC1xHnGYiPNg8nHXer69s1vBZAxOmYe8SRe4WdXF/8Vi/wPO17wpDWc7vSe87Rnrxi6HQ0Hbr1Ze7xucrUK4Kx8nviO3/b6mRc/LBR114O6OnvcOluH4X7s9llEQpwp380V/1ShAfWk89Yq8+BShY54zNZwc6wdfrTwenNE4Kk086JQV8lsF8oTsobTozvGNyHcuOuhTxGDly4sNjFDP41JFwpQ7GVgaWN/RAW9T64g8oz3HfAQFGt9YeWl2X4tTZNy2yvylbmSTOtSmsY82a4qF7JsVh13JdVnPqpqdTD11dxRSUao+CfM70KifJ82hPoRWAy+T0wlbResY2Mn1dYck2q3TnZRTx4946+p3b9M4t91on4i+OrwnLERpSdRfAFj9LTsS7DKoRe7BNzjs8tx9nMXinoOgJyjr4Y5loiF/hWKK5ACAh+IOJaTCfI43mcpzSIcpuQEXTT6pUshPQt5eUpoPcaHz7D33zWPhW1FqnxMSK0ymsxYLgB2HwjqdejQDOqzXACllwDJDAE5pGjIyIp7TpC5+rKjc7nGnZQ7L/QEmCY9IXrHGihl5BbjxRhJHo/S5KJ6VybjGNSrD303Mvsb9sMAQq4Rd9Mu6RYK9teUooW2Vh2We+F1ILfBCODx4//HsRPt8hg8OXE2atEwndGIdxnt1Vq405xxyq6AwNG56oXO199Nnqcb9wQDonc5F0bsl5COGGj1MQxlkwvaOHx1/VvkNa2HttcY+RH8pucBbRpNIo1LYeXAhYVAaEKG39oDB8pjLSNgEv+N+mBz6NQamFOmbnSWDcK10vE022Zl4uMctztXk7uz6TuK87wr6kBHRj4ZSVR62VGfxhxH9Ky92nIpTmnWT69UJCVFUFNVzby5UD0rMCvCeR0Edru319VrO1Ffl/Fy/1cjZDlySegaKeorBISes7CWy99bFey0Jw4SMBe6Qaw5EAITYccFsETkE39MCNX4XM5HokezfRgIH+yeVq8aa8GqH0quuZZ/1QMVdy44eqWC1giKm98WCJMNMHM51293DQSxn/PDS5OItXXtw+CqnnrWSDUL/WRv6pFrcDrSOjGwxljXWrglMBFoeapgLi8GY1QxlLjzR0QD3vvUByF6vfqu6cjX6h4TSfdAQimw4OBSdfIVBy175BeZAjRb6hsb14VH2G1g5vnruOKqwt+lQYoiEf8Hs9MMX1kR3ruOVTHLyVk/oeNLlzWwLR9o8MhnB1B+BCNsOPT8IY6KKjLlyT6+Tf8vA6xuYNHGbP7s8m+6HrBE6Vl+VhUQt1poO5CZkgznAHzWKz1KzBw2WXF76Xg5stAysH+CuplL7V73LQPXP2hPExPNYIxZWCV/SRS/zqLqQMwEA/lgu97Oze4Y6LnttQwT5dFmUnGTphtNREL9jRgwZU=', -- Key from dbo.[User]
    2, -- Status
    0, -- Type
    0, -- AccessAll
    NULL, -- ExternalId
    '2024-09-16 15:34:29.1200000', -- CreationDate from dbo.[User]
    '2024-09-16 15:34:32.8833333', -- RevisionDate from dbo.[User]
    NULL, -- Permissions
    NULL, -- ResetPasswordKey
    0  -- AccessSecretsManager
);

INSERT INTO dbo.[Group] (
    Id, OrganizationId, Name, AccessAll, ExternalId, CreationDate, RevisionDate
) VALUES (
    -- N'7901f82b-9e4c-47ee-9804-b1ed012fe1bc',
    NEWID(),
    @orgID,
    N'ephemeral-test',
    0,
    NULL,
    N'2024-09-16 18:29:56.320',
    N'2024-09-16 18:29:56.320'
)

INSERT INTO dbo.GroupUser (GroupId, OrganizationUserId)
SELECT 
    g.Id AS GroupId,
    ou.Id AS OrganizationUserId
FROM 
    dbo.[Group] g
JOIN 
    dbo.OrganizationUser ou 
    ON g.OrganizationId = ou.OrganizationId
WHERE 
    g.Name = 'ephemeral-test'  -- Replace with the actual group name or other criteria
    AND ou.Email = 'ee-user@bitwarden.com';  -- Replace with the actual user email or other criteria